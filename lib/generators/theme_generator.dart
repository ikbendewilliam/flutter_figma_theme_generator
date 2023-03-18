import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/color_generator.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/color_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/typography_resolver.dart';

class ThemeGenerator {
  static bool _generatedBase = false;

  static GeneratedContent generateTheme(Map<String, dynamic> json, String themeFileName, PubspecConfig pubspecConfig) {
    var allContent = GeneratedContent({}, [], null);
    final resolverMap = <BaseResolver, BaseGenerator>{
      TypographyResolver(): FontGenerator(),
      ColorResolver(): ColorGenerator(),
    };
    for (final entry in resolverMap.entries) {
      final data = entry.key.resolve(json, pubspecConfig);
      if (data.isEmpty) continue;
      allContent += entry.value.generate(data, pubspecConfig);
    }
    if (allContent.files.isNotEmpty) return allContent;
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
  GeneratedContent generate(Map<String, dynamic> data, PubspecConfig pubspecConfig);
}
