import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/color_generator.dart';
import 'package:flutter_figma_theme_generator/utils/font_generator.dart';

class ThemeGenerator {
  static GeneratedContent generateTheme(String themeFile, String themeFileName, PubspecConfig pubspecConfig) {
    final generators = [
      FontGenerator(),
      ColorGenerator(),
    ];
    final json = jsonDecode(themeFile) as Map<String, dynamic>;
    for (final generator in generators) {
      if (generator.matchesSchema(json)) {
        return generator.generate(json, pubspecConfig);
      }
    }
    return GeneratedContent({}, ['No generator found for schema for file $themeFileName']);
  }
}

abstract class BaseGenerator {
  bool matchesSchema(Map<String, dynamic> schema);

  GeneratedContent generate(Map<String, dynamic> schema, PubspecConfig pubspecConfig);
}
