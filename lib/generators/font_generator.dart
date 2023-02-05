import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/theme_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/model/text_style.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class FontGenerator extends BaseGenerator {
  @override
  bool matchesSchema(Map<String, dynamic> schema) =>
      schema['Typography'] != null;

  @override
  GeneratedContent generate(
      Map<String, dynamic> schema, PubspecConfig pubspecConfig) {
    final typography = schema['Typography'] as Map<String, dynamic>;
    final textStyles = <String, TextStyle>{};
    final files = <String, String>{};

    for (final entry in typography.entries) {
      if (_isNotFont(entry.key)) continue;
      final json = entry.value as Map<String, dynamic>;
      textStyles.addAll(_generateTextStyles(entry.key, json, typography));
    }
    final fontFamilies = textStyles.entries
        .map((e) => e.value.fontFamily)
        .toSet()
      ..removeWhere(pubspecConfig.fonts.contains);
    final warnings = fontFamilies
        .map((fontFamily) =>
            'Warning: Font family "$fontFamily" is not defined in pubspec.yaml')
        .toList();

    var textStyleFile = '''import 'package:flutter/material.dart';\n\n''';
    textStyleFile +=
        'class ${pubspecConfig.projectName.upperCamelCase}TextTheme {\n';
    for (final textStyle in textStyles.entries) {
      textStyleFile += '  late final TextStyle ${textStyle.key};\n';
    }
    textStyleFile +=
        '\n  ${pubspecConfig.projectName.upperCamelCase}TextTheme({\n';
    textStyleFile += '    TextStyle? allOverrides,\n';
    textStyleFile += textStyles.entries
        .map((textStyle) => '    TextStyle? ${textStyle.key}Overrides,\n')
        .join();
    textStyleFile += '  }) {\n';
    textStyleFile += textStyles.entries
        .map((textStyle) =>
            '    ${textStyle.key} = ${textStyle.value.stringWithOverrides('${textStyle.key}Overrides')};\n')
        .join('');
    textStyleFile += '  }\n';
    textStyleFile += '}\n';

    files['${pubspecConfig.projectName.snakeCase}_text_theme'] = textStyleFile;

    return GeneratedContent(files, warnings);
  }

  TextStyle _generateTextStyle(
      Map<String, dynamic> data, Map<String, dynamic> typography) {
    final fontFamily =
        _fromDataOrTypography(data['fontFamily'] as String?, typography);
    final fontWeight =
        _fromDataOrTypography(data['fontWeight'] as String?, typography);
    final fontSizeData =
        _fromDataOrTypography(data['fontSize'] as String?, typography);
    final lineHeight =
        _fromDataOrTypography(data['lineHeight'] as String?, typography);
    final letterSpacing =
        _fromDataOrTypography(data['letterSpacing'] as String?, typography);

    final fontSize = double.tryParse(fontSizeData ?? '');

    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: _getFontWeight(fontWeight),
      height: _getHeight(lineHeight ?? '', fontSize),
      letterSpacing: _getLetterSpacing(letterSpacing ?? ''),
    );
  }

  String? _fromDataOrTypography(String? data, Map<String, dynamic> typography) {
    if (data == null) return null;
    if (data.contains(RegExp(r'(\/|\*|round\(.+\)|\(.+\))'))) {
      return RegExp(r'({[^{}]+}|\d+|round\(.+\)|\(.+\))')
          .allMatches(data)
          .fold(1.0, (previousValue, element) {
        String operator;
        if (element.start == 0) {
          if (data.startsWith('round(') && data.endsWith(')')) {
            return double.tryParse(_fromDataOrTypography(
                            data.substring(6, data.length - 1), typography) ??
                        '')
                    ?.roundToDouble() ??
                1.0;
          } else if (data.startsWith('(') && data.endsWith(')')) {
            return double.tryParse(_fromDataOrTypography(
                        data.substring(1, data.length - 1), typography) ??
                    '') ??
                1.0;
          } else {
            operator = '*';
          }
        } else {
          operator = data.substring(element.start - 1, element.start);
        }
        final nextValue = double.tryParse(_fromDataOrTypography(
                    data.substring(element.start, element.end), typography) ??
                '') ??
            1;
        if (operator == '/') {
          return previousValue / nextValue;
        } else {
          return previousValue * nextValue;
        }
      }).toString();
    }
    if (!data.startsWith('{') || !data.endsWith('}')) return data;
    try {
      final typographyKeys = data.substring(1, data.length - 1).split('.');
      final value = typographyKeys.fold(typography, (value, e) => value[e]);
      return _fromDataOrTypography(value['value'], typography);
    } catch (e) {
      return data;
    }
  }

  double? _getLetterSpacing(String? letterSpacing) {
    if (letterSpacing == null) return null;
    if (letterSpacing.endsWith('%')) {
      final percentage =
          double.tryParse(letterSpacing.substring(0, letterSpacing.length - 1));
      return percentage != null ? percentage / 100 : null;
    }
    return double.tryParse(letterSpacing);
  }

  double? _getHeight(String? lineHeight, double? fontSize) {
    if (lineHeight == null || lineHeight == 'AUTO' || fontSize == null) {
      return null;
    }
    final height = double.tryParse(lineHeight);
    return height == null ? null : height / fontSize;
  }

  String? _getFontWeight(String? fontWeight) {
    switch (fontWeight) {
      case 'Regular':
        return 'FontWeight.w400';
      case 'Medium':
        return 'FontWeight.w500';
      case 'SemiBold':
        return 'FontWeight.w600';
      case 'Bold':
        return 'FontWeight.bold';
      default:
        return null;
    }
  }

  Map<String, TextStyle> _generateTextStyles(
      String key, Map<String, dynamic> data, Map<String, dynamic> typography) {
    final textStyles = <String, TextStyle>{};
    for (final entry in data.entries) {
      if (entry.key == 'value' && entry.value is Map<String, dynamic>) {
        textStyles[key.camelCase] =
            _generateTextStyle(entry.value as Map<String, dynamic>, typography);
      } else if (!_isNotFont(entry.key) &&
          entry.value is Map<String, dynamic>) {
        textStyles.addAll(_generateTextStyles('${key}_${entry.key}'.camelCase,
            entry.value as Map<String, dynamic>, typography));
      }
    }
    return textStyles;
  }

  static const ends = [
    '-weight',
    '-font',
    '-weight-regular',
    '-weight-bold',
    '-scale',
    '-base-size',
    'lineheight',
    'p-spacing-base-unit',
    'paragraph',
    'type',
  ];

  bool _isNotFont(String key) => ends.any(key.endsWith);
}
