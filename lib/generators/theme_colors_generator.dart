import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorsGenerator {
  final _warnings = <String>[];
  var themeData = <String, dynamic>{};

  GeneratedContent generate(Map<String, dynamic> schema, PubspecConfig pubspecConfig, bool isBase) {
    _warnings.clear();
    final themeInstanceName = schema.keys.first;
    themeData = schema.values.first as Map<String, dynamic>;
    final colors = <String, String>{};
    final files = <String, String>{};

    for (final entry in themeData.entries) {
      final json = entry.value as Map<String, dynamic>;
      colors.addAll(_generateColors(entry.key, json, pubspecConfig.projectName.upperCamelCase));
    }

    String instanceName;
    final defaultInstanceName = '${pubspecConfig.projectName.upperCamelCase}ColorsThemeDefault';
    if (isBase) {
      instanceName = defaultInstanceName;
      var baseColorFile = '''import 'package:flutter/material.dart';\n\n''';
      baseColorFile += '''import '${pubspecConfig.projectName.snakeCase}_colors.dart';\n\n''';
      baseColorFile += 'class $instanceName {\n';
      baseColorFile += colors.entries.map((color) => '  final Color ${color.key};\n').join();
      baseColorFile += '\n  $instanceName({\n';
      baseColorFile += colors.entries.map((color) => '    Color? ${color.key},\n').join();
      baseColorFile += '  })  : ';
      baseColorFile += colors.entries.map((color) => '${color.key} = ${color.key} ?? ${color.value}').join(',\n        ');
      baseColorFile += ';\n';
      baseColorFile += '}\n';
      files['${pubspecConfig.projectName.snakeCase}_colors_theme_default'] = baseColorFile;
    } else {
      instanceName = '${pubspecConfig.projectName.upperCamelCase}ColorsTheme${themeInstanceName.upperCamelCase}';
      var colorInstanceFile = '''import '${pubspecConfig.projectName.snakeCase}_colors.dart';\n''';
      colorInstanceFile += '''import '${pubspecConfig.projectName.snakeCase}_colors_theme_default.dart';\n\n''';
      colorInstanceFile += 'class $instanceName {\n';
      colorInstanceFile += '  $instanceName._();\n\n';
      colorInstanceFile += '  static final instance = $defaultInstanceName(\n';
      colorInstanceFile += colors.entries.map((color) => '    ${color.key}: ${color.value},\n').join('');
      colorInstanceFile += '  );\n}\n';
      files['${pubspecConfig.projectName.snakeCase}_colors_theme_${themeInstanceName.snakeCase}'] = colorInstanceFile;
    }

    return GeneratedContent(files, _warnings, instanceName);
  }

  Map<String, String> _generateColors(String key, Map<String, dynamic> data, String projectNameUpperCamelCase) {
    final colors = <String, String>{};
    for (final entry in data.entries) {
      if (entry.key == 'value' && entry.value is String && _isColor(data)) {
        colors[key.camelCase] = _valueFromThemeColors(entry.value, projectNameUpperCamelCase);
      } else if (entry.value is Map<String, dynamic>) {
        colors.addAll(_generateColors('${key}_${entry.key}'.camelCase, entry.value as Map<String, dynamic>, projectNameUpperCamelCase));
      }
    }
    return colors;
  }

  String _valueFromThemeColors(String data, String projectNameUpperCamelCase) {
    if (data.startsWith('rgba(')) {
      final color = data.substring(5, data.length - 1);
      final parts = color.split(',');
      final colorReference = parts[0].trim();
      final opacity = double.tryParse(parts[1].trim()) ?? 1;
      return '${projectNameUpperCamelCase}Colors.${_getFromReference(colorReference).camelCase}.withOpacity($opacity)';
    } else if (data.startsWith('{') && data.endsWith('}')) {
      return '${projectNameUpperCamelCase}Colors.${_getFromReference(data).camelCase}';
    }
    return data;
  }

  String _getFromReference(String data) {
    if (!data.startsWith('{') || !data.endsWith('}')) return data;
    final colorPaletteKeys = data.substring(1, data.length - 1).split('.');
    try {
      final value = colorPaletteKeys.fold(themeData, (value, e) => value[e]);
      final newData = value['value'] as String;
      return _getFromReference(newData);
    } catch (_) {
      return data.substring(1, data.length - 1);
    }
  }

  bool _isColor(dynamic data) => data is Map<String, dynamic> && data['type'] == 'color'; // For now only colors are supported
}
