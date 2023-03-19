import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorGenerator {
  final _warnings = <String>[];

  GeneratedContent generate(Map<String, String> colors, PubspecConfig pubspecConfig, String themeInstanceName, bool isBase) {
    _warnings.clear();
    final files = <String, String>{};

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
}
