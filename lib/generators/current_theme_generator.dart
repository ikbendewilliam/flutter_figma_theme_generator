import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class CurrentThemeGenerator {
  static GeneratedContent generateTheme(Iterable<String> generatedInstances, PubspecConfig pubspecConfig, bool hasFontTheme) {
    final defaultTheme = generatedInstances.first;
    final otherThemes = generatedInstances.skip(1);
    final themeName = '${pubspecConfig.projectName.upperCamelCase}Theme';
    final fontTheme = hasFontTheme ? '${pubspecConfig.projectName.upperCamelCase}TextTheme' : null;
    final fontThemeArgument = fontTheme != null ? ', const ${fontTheme.upperCamelCase}()' : '';
    final projectNameLength = pubspecConfig.projectName.length;
    final themeStartLength = projectNameLength + 'ColorsTheme'.length;

    var themeFile = 'import \'package:flutter/material.dart\';\n\n';
    themeFile += generatedInstances.map((e) => 'import \'${e.snakeCase}.dart\';\n').join();
    if (fontTheme != null) themeFile += 'import \'${fontTheme.snakeCase}.dart\';\n\n';
    themeFile += '\n';
    themeFile += 'class $themeName {\n';
    themeFile += '  static final _${defaultTheme.camelCase} = $themeName(${defaultTheme.upperCamelCase}()$fontThemeArgument);\n';
    themeFile += otherThemes.map((e) => '  static final _${e.camelCase} = $themeName(${e.upperCamelCase}.instance$fontThemeArgument);\n').join();
    themeFile += '\n';
    themeFile += '  final ${defaultTheme.upperCamelCase} colors;\n';
    if (fontTheme != null) themeFile += '  final ${fontTheme.upperCamelCase} fonts;\n';
    themeFile += '\n';
    themeFile += '  $themeName(this.colors';
    if (fontTheme != null) themeFile += ', this.fonts';
    themeFile += ');\n';
    themeFile += '\n';
    themeFile += '  static $themeName of(BuildContext context';
    if (generatedInstances.length == 1) {
      themeFile += ') => _${defaultTheme.camelCase};\n';
    } else {
      themeFile += ', {\n';
      themeFile += generatedInstances.map((e) => '    force${e.substring(themeStartLength).upperCamelCase} = false,\n').join();
      themeFile += '  }) {\n';
      themeFile += generatedInstances.map((e) => '    if (force${e.substring(themeStartLength).upperCamelCase}) return _${e.camelCase};\n').join();
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
