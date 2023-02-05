import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/color_generator.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';

class ThemeGenerator {
  static bool _generatedBase = false;

  static GeneratedContent generateTheme(Map<String, dynamic> json,
      String themeFileName, PubspecConfig pubspecConfig) {
    final generators = [
      FontGenerator(),
      ColorGenerator(),
    ];
    for (final generator in generators) {
      if (generator.matchesSchema(json)) {
        return generator.generate(json, pubspecConfig);
      }
    }
    final content = ThemeColorsGenerator().generate(
      json,
      pubspecConfig,
      !_generatedBase,
    );
    _generatedBase = true;
    return content;
  }
}

abstract class BaseGenerator {
  bool matchesSchema(Map<String, dynamic> schema);

  GeneratedContent generate(
      Map<String, dynamic> schema, PubspecConfig pubspecConfig);
}
