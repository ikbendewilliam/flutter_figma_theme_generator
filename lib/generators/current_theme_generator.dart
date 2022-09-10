import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class CurrentThemeGenerator {
  static GeneratedContent generateTheme(Iterable<String> generatedInstances, PubspecConfig pubspecConfig) {
    final defaultTheme = generatedInstances.first;
    final otherThemes = generatedInstances.skip(1);
    var themeFile = 'import \'package:flutter/material.dart\';\n\n';
    themeFile += generatedInstances.map((e) => 'import \'${e.snakeCase}.dart\';\n').join();
    themeFile += '\n';
    themeFile += 'class ${pubspecConfig.projectName.upperCamelCase}Theme {\n';
    themeFile += '  static final _${defaultTheme.camelCase} = ${defaultTheme.upperCamelCase}();\n';
    themeFile += otherThemes.map((e) => '  static final _${e.camelCase} = ${e.upperCamelCase}.instance;\n').join();
    themeFile += '\n';
    themeFile += '  static ${defaultTheme.upperCamelCase} of(BuildContext context';
    if (generatedInstances.length == 1) {
      themeFile += ') => _${defaultTheme.camelCase};\n';
    } else {
      themeFile += ', {\n';
      themeFile += generatedInstances.map((e) => '    force${e.upperCamelCase} = false,\n').join();
      themeFile += '  }) {\n';
      themeFile += generatedInstances.map((e) => '    if (force${e.upperCamelCase}) return _${e.camelCase};\n').join();
      themeFile += '\n';
      themeFile += '    final brightness = MediaQuery.of(context).platformBrightness;\n';
      themeFile += '    if (brightness == Brightness.dark) return _${pubspecConfig.defaultThemeIsDarkMode ? defaultTheme.camelCase : otherThemes.first.camelCase};\n';
      themeFile += '    return _${pubspecConfig.defaultThemeIsDarkMode ? otherThemes.first.camelCase : defaultTheme.camelCase};\n';
      themeFile += '  }\n';
    }
    themeFile += '}\n';
    // Possible expansion to add support for more than two themes
    // Possible expansion to add support for saving to local storage
    // If you want any of the features above, please open an issue on GitHub
    return GeneratedContent({
      '${pubspecConfig.projectName.snakeCase}_theme': themeFile,
    }, []);
  }
}
