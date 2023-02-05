import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class CurrentThemeGenerator {
  static GeneratedContent generateTheme(Iterable<String> generatedInstances,
      PubspecConfig pubspecConfig, bool hasFontTheme) {
    final defaultTheme = generatedInstances.first;
    final otherThemes = generatedInstances.skip(1);
    final themeName = '${pubspecConfig.projectName.upperCamelCase}Theme';
    final fontTheme = hasFontTheme
        ? '${pubspecConfig.projectName.upperCamelCase}TextTheme'
        : null;
    final projectNameLength = pubspecConfig.projectName.upperCamelCase
        .length; // Convert to camel case to not have _ in the name
    final themeStartLength = projectNameLength + 'ColorsTheme'.length;
    var defaultLight = pubspecConfig.defaultLight?.camelCase;
    if (defaultLight != null &&
        !generatedInstances.contains(defaultLight.upperCamelCase)) {
      defaultLight = null;
    }
    defaultLight ??=
        pubspecConfig.defaultThemeIsDarkMode && otherThemes.isNotEmpty
            ? otherThemes.first.camelCase
            : defaultTheme.camelCase;
    var defaultDark = pubspecConfig.defaultDark?.camelCase;
    if (defaultDark != null &&
        !generatedInstances.contains(defaultDark.upperCamelCase)) {
      defaultDark = null;
    }
    defaultDark ??= pubspecConfig.defaultThemeIsDarkMode || otherThemes.isEmpty
        ? defaultTheme.camelCase
        : otherThemes.first.camelCase;
    const enumName = 'ThemeType';

    var themeFile = 'import \'package:flutter/material.dart\';\n\n';
    themeFile += generatedInstances
        .map((e) => 'import \'${e.snakeCase}.dart\';\n')
        .join();
    if (fontTheme != null) {
      themeFile += 'import \'${fontTheme.snakeCase}.dart\';\n';
    }
    themeFile += '\n';
    themeFile += 'class $themeName {\n';
    if (generatedInstances.length > 1) {
      themeFile += '  /// Set to override the returned theme\n';
      themeFile += '  static $enumName? userPrefferedThemeType;\n';
      themeFile += '\n';
    }
    themeFile += '  /// Set to add logic in the creation of your themes.\n';
    themeFile += '  /// This can be used to override default colors for\n';
    themeFile += '  /// all or specific textStyles\n';
    themeFile +=
        '  static ${fontTheme ?? 'dynamic'} Function(${defaultTheme.upperCamelCase} colors)? textThemeBuilder;\n';
    themeFile += '\n';
    if (generatedInstances.length > 1) {
      themeFile += '  static final _themeTypeMap = <$enumName, $themeName>{\n';
      themeFile += generatedInstances
          .map((e) => '    $enumName.${e.camelCase}Type: _${e.camelCase},\n')
          .join();
      themeFile += '  };\n';
      themeFile += '\n';
    }
    themeFile +=
        '  static final _${defaultTheme.camelCase} = _create$themeName(${defaultTheme.upperCamelCase}());\n';
    themeFile += otherThemes
        .map((e) =>
            '  static final _${e.camelCase} = _create$themeName(${e.upperCamelCase}.instance);\n')
        .join();
    themeFile += '\n';
    themeFile += '  final ${defaultTheme.upperCamelCase} colors;\n';
    if (fontTheme != null) {
      themeFile += '  final ${fontTheme.upperCamelCase} textStyles;\n';
    }
    themeFile += '\n';
    themeFile += '  $themeName(this.colors';
    if (fontTheme != null) themeFile += ', this.textStyles';
    themeFile += ');\n';
    themeFile += '\n';
    themeFile +=
        '  static $themeName _create$themeName(${defaultTheme.upperCamelCase} colors) {\n';
    if (fontTheme != null) {
      themeFile +=
          '    final textStyles = textThemeBuilder?.call(colors) ?? $fontTheme();\n';
    }
    themeFile += '    return $themeName(colors';
    if (fontTheme != null) {
      themeFile += ', textStyles);\n';
    } else {
      themeFile += ');\n';
    }
    themeFile += '  }\n';
    themeFile += '\n';
    themeFile += '  static $themeName of(';
    if (generatedInstances.length == 1) {
      themeFile += 'BuildContext context) => _${defaultTheme.camelCase};\n';
      themeFile += '}\n';
    } else {
      themeFile += '\n';
      themeFile += '    BuildContext context, {\n';
      themeFile += generatedInstances
          .map((e) =>
              '    bool force${e.substring(themeStartLength).upperCamelCase} = false,\n')
          .join();
      themeFile += '  }) {\n';
      themeFile += generatedInstances
          .map((e) =>
              '    if (force${e.substring(themeStartLength).upperCamelCase}) return _${e.camelCase};\n')
          .join();
      themeFile +=
          '    if (userPrefferedThemeType != null) return _themeTypeMap[userPrefferedThemeType!]!;\n';
      themeFile += '\n';
      themeFile +=
          '    final brightness = MediaQuery.of(context).platformBrightness;\n';
      themeFile +=
          '    if (brightness == Brightness.dark) return _$defaultDark;\n';
      themeFile += '    return _$defaultLight;\n';
      themeFile += '  }\n';
      themeFile += '}\n';
      themeFile += '\n';
      themeFile += 'enum $enumName {\n';
      themeFile +=
          generatedInstances.map((e) => '  ${e.camelCase}Type,\n').join();
      themeFile += '}\n';
    }
    return GeneratedContent({
      '${pubspecConfig.projectName.snakeCase}_theme': themeFile,
    }, []);
  }
}
