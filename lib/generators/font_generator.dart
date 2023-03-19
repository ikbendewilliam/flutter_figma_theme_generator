import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/base_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/model/text_style.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class TypographyGenerator extends BaseGenerator {
  @override
  GeneratedContent generate(Map<String, dynamic> data, PubspecConfig pubspecConfig) {
    final textStyles = data.cast<String, TextStyle>();
    final files = <String, String>{};

    final fontFamilies = textStyles.entries.map((e) => e.value.fontFamily).toSet()..removeWhere(pubspecConfig.fonts.contains);
    final warnings = fontFamilies.map((fontFamily) => 'Warning: Font family "$fontFamily" is not defined in pubspec.yaml').toList();

    var textStyleFile = '''import 'package:flutter/material.dart';\n\n''';
    textStyleFile += 'class ${pubspecConfig.projectName.upperCamelCase}TextTheme {\n';
    for (final textStyle in textStyles.entries) {
      textStyleFile += '  late final TextStyle ${textStyle.key};\n';
    }
    textStyleFile += '\n  ${pubspecConfig.projectName.upperCamelCase}TextTheme({\n';
    textStyleFile += '    TextStyle? allOverrides,\n';
    textStyleFile += textStyles.entries.map((textStyle) => '    TextStyle? ${textStyle.key}Overrides,\n').join();
    textStyleFile += '  }) {\n';
    textStyleFile += textStyles.entries.map((textStyle) => '    ${textStyle.key} = ${textStyle.value.stringWithOverrides('${textStyle.key}Overrides')};\n').join('');
    textStyleFile += '  }\n';
    textStyleFile += '}\n';

    files['${pubspecConfig.projectName.snakeCase}_text_theme'] = textStyleFile;

    return GeneratedContent(files, warnings);
  }
}
