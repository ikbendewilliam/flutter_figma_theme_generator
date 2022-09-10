import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorsGenerator {
  final _warnings = <String>[];
  var themeData = <String, dynamic>{};

  GeneratedContent generate(Map<String, dynamic> schema, PubspecConfig pubspecConfig, bool generatedBase) {
    _warnings.clear();
    final themeInstanceName = schema.keys.first;
    themeData = schema.values.first as Map<String, dynamic>;
    final colors = <String, String>{};
    final files = <String, String>{};

    for (final entry in themeData.entries) {
      final json = entry.value as Map<String, dynamic>;
      colors.addAll(_generateColors(entry.key, json, pubspecConfig.projectName.upperCamelCase));
    }

    if (!generatedBase) {
      var baseColorFile = '''import 'package:flutter/material.dart';\n''';
      baseColorFile += '''import '${pubspecConfig.projectName.snakeCase}_colors.dart';\n\n''';
      baseColorFile += 'class ${pubspecConfig.projectName.upperCamelCase}ColorsThemeDefault {\n';
      baseColorFile += colors.entries.map((color) => '  final Color ${color.key};\n').join();
      baseColorFile += '\n  const ${pubspecConfig.projectName.upperCamelCase}ColorsThemeDefault({\n';
      baseColorFile += colors.entries.map((color) => '    this.${color.key} = ${color.value},\n').join();
      baseColorFile += '  });\n';
      baseColorFile += '}\n';
      files['${pubspecConfig.projectName.snakeCase}_color_theme_default'] = baseColorFile;
    } else {
      var colorInstanceFile = '''import '${pubspecConfig.projectName.snakeCase}_colors.dart';\n\n''';
      colorInstanceFile += '''import '${pubspecConfig.projectName.snakeCase}_color_theme_default.dart';\n\n''';
      colorInstanceFile +=
          'class ${pubspecConfig.projectName.upperCamelCase}ColorTheme${themeInstanceName.upperCamelCase} extends ${pubspecConfig.projectName.upperCamelCase}ColorsThemeDefault {\n';
      colorInstanceFile += '  const ${pubspecConfig.projectName.upperCamelCase}ColorTheme${themeInstanceName.upperCamelCase}()\n';
      colorInstanceFile += '      : super(\n';
      colorInstanceFile += colors.entries.map((color) => '          ${color.key}: ${color.value},\n').join('');
      colorInstanceFile += '        );\n}\n';

      files['${pubspecConfig.projectName.snakeCase}_color_theme_${themeInstanceName.snakeCase}'] = colorInstanceFile;
    }

    return GeneratedContent(files, _warnings);
  }

  Map<String, String> _generateColors(String key, Map<String, dynamic> data, String projectNameUpperCamelCase) {
    final colors = <String, String>{};
    for (final entry in data.entries) {
      if (entry.key == 'value' && entry.value is String && _isColor(data)) {
        colors[key.camelCase] = _valueFromColorPalette(entry.value, projectNameUpperCamelCase);
      } else if (entry.value is Map<String, dynamic>) {
        colors.addAll(_generateColors('${key}_${entry.key}'.camelCase, entry.value as Map<String, dynamic>, projectNameUpperCamelCase));
      }
    }
    return colors;
  }

  String _valueFromColorPalette(String data, String projectNameUpperCamelCase) {
    // TODO: add support for rgba({neutrals.blue.24}, .64),
    // TODO: add support for rgba({UI.bg.canvas}, .72)
    if (data.startsWith('{') && data.endsWith('}')) {
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
