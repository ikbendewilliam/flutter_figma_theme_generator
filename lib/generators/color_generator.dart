import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/base_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ColorGenerator extends BaseGenerator {
  final _warnings = <String>[];

  @override
  GeneratedContent generate(Map<String, dynamic> data, PubspecConfig pubspecConfig) {
    _warnings.clear();
    final files = <String, String>{};

    var colorFile = '''import 'package:flutter/material.dart';\n\n''';
    colorFile += 'class ${pubspecConfig.projectName.upperCamelCase}Colors {\n';
    colorFile += data.entries.map((color) => '  static const ${color.key} = Color(${color.value});\n').join();
    colorFile += '}\n';

    files['${pubspecConfig.projectName.snakeCase}_colors'] = colorFile;

    return GeneratedContent(files, _warnings);
  }
}
