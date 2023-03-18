import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/text_style.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class TypographyResolver extends BaseResolver<TextStyle> {
  bool _isTypography(Map<String, dynamic> data) => data['type'] == 'typography' && data['value'] != null;

  @override
  Map<String, TextStyle> resolve(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig, {
    String keys = '',
    Map<String, dynamic> allData = const {},
  }) {
    if (allData.isEmpty) {
      allData = data;
      if (pubspecConfig.typographyKey?.isNotEmpty == true) {
        allData = allData[pubspecConfig.typographyKey!] as Map<String, dynamic>;
      }
    }
    if (_isTypography(data)) {
      return {keys.camelCase: _resolveTypography(data['value'], allData)};
    }
    final result = <String, TextStyle>{};
    for (final entry in data.entries) {
      if (entry.value is Map<String, dynamic>) {
        var newKeys = keys.isEmpty ? entry.key : '${keys}_${entry.key}';
        if (newKeys == pubspecConfig.typographyKey) {
          newKeys = '';
        }
        result.addAll(resolve(
          entry.value as Map<String, dynamic>,
          pubspecConfig,
          keys: newKeys,
          allData: allData,
        ));
      }
    }
    return result;
  }

  TextStyle _resolveTypography(Map<String, dynamic> data, Map<String, dynamic> typography) {
    final fontFamily = _fromDataOrTypography(data['fontFamily'] as String?, typography);
    final fontWeight = _fromDataOrTypography(data['fontWeight'] as String?, typography);
    final fontSizeData = _fromDataOrTypography(data['fontSize'] as String?, typography);
    final lineHeight = _fromDataOrTypography(data['lineHeight'] as String?, typography);
    final letterSpacing = _fromDataOrTypography(data['letterSpacing'] as String?, typography);
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
      return RegExp(r'({[^{}]+}|\d+|round\(.+\)|\(.+\))').allMatches(data).fold(1.0, (previousValue, element) {
        String operator;
        if (element.start == 0) {
          if (data.startsWith('round(') && data.endsWith(')')) {
            return double.tryParse(_fromDataOrTypography(data.substring(6, data.length - 1), typography) ?? '')?.roundToDouble() ?? 1.0;
          } else if (data.startsWith('(') && data.endsWith(')')) {
            return double.tryParse(_fromDataOrTypography(data.substring(1, data.length - 1), typography) ?? '') ?? 1.0;
          } else {
            operator = '*';
          }
        } else {
          operator = data.substring(element.start - 1, element.start);
        }
        final nextValue = double.tryParse(_fromDataOrTypography(data.substring(element.start, element.end), typography) ?? '') ?? 1;
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
      final percentage = double.tryParse(letterSpacing.substring(0, letterSpacing.length - 1));
      return percentage != null ? percentage / 100 : null;
    }
    return double.tryParse(letterSpacing);
  }

  double? _getHeight(String? lineHeight, double? fontSize) {
    if (lineHeight == null || lineHeight == 'AUTO' || fontSize == null || fontSize == 0) {
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
}
