import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/base_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorGenerator extends BaseGenerator {
  final _warnings = <String>[];

  @override
  GeneratedContent generate(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig,
  ) {
    _warnings.clear();
    final instances = data.cast<String, Map<String, dynamic>>();
    var generatedContent = GeneratedContent({}, []);

    for (final entry in instances.entries) {
      final files = <String, String>{};
      final String instanceName;
      final colors = entry.value;
      final defaultInstanceName = '${pubspecConfig.projectName.upperCamelCase}ColorsThemeDefault';
      final themeInstanceName = entry.key;
      if (themeInstanceName == pubspecConfig.defaultTheme ||
          instances.entries.length == 1 ||
          (instances.entries.first.key == themeInstanceName && pubspecConfig.defaultTheme == null)) {
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
      generatedContent += GeneratedContent(files, _warnings, [instanceName]);
    }

    return generatedContent;
  }
}
