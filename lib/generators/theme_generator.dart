import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/color_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/typography_resolver.dart';

class ThemeGenerator {
  static bool _generatedBase = false;

  static GeneratedContent generateTheme(Map<String, dynamic> json, String themeFileName, PubspecConfig pubspecConfig) {
    final resolvers = <BaseResolver>[
      TypographyResolver(),
      ColorResolver(),
    ];
    for (final resolver in resolvers) {
      final data = resolver.resolve(json, pubspecConfig);
      if (data.isEmpty) continue;
      // return generator.generate(json, pubspecConfig);
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
  GeneratedContent generate(Map<String, dynamic> data, PubspecConfig pubspecConfig);
}
