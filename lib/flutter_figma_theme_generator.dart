library flutter_figma_theme_generator;

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/base_generator.dart';
import 'package:flutter_figma_theme_generator/generators/color_generator.dart';
import 'package:flutter_figma_theme_generator/generators/current_theme_generator.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/color_resolver.dart';
import 'package:flutter_figma_theme_generator/resolvers/typography_resolver.dart';

import 'generators/font_generator.dart';

class FlutterFigmaThemeGenerator {
  static Future<List<GeneratedContent>> processFiles(
    PubspecConfig pubspecConfig,
    Map<String, Map<String, dynamic>> contents,
    String defaultTheme,
  ) async {
    final generatedContents = <GeneratedContent>[];

    generatedContents.addAll(await Future.wait(contents.entries.map((e) => _processThemeFile(e.value, e.key, pubspecConfig, e.key == defaultTheme))));
    final generatedInstances = generatedContents.map((e) => e.themeInstanceName).whereType<String>();
    generatedContents.add(await _generateThemeFile(generatedInstances, pubspecConfig));

    return generatedContents;
  }

  static Future<GeneratedContent> _generateThemeFile(Iterable<String> generatedInstances, PubspecConfig pubspecConfig) async {
    return CurrentThemeGenerator.generateTheme(generatedInstances, pubspecConfig);
  }

  static Future<GeneratedContent> _processThemeFile(
    Map<String, dynamic> json,
    String themeInstanceName,
    PubspecConfig pubspecConfig,
    bool isDefaultTheme,
  ) async {
    var allContent = GeneratedContent({}, [], null);
    final resolverMap = <BaseResolver, BaseGenerator>{
      TypographyResolver(): TypographyGenerator(),
      ColorResolver(): ColorGenerator(),
    };
    for (final entry in resolverMap.entries) {
      final data = entry.key.resolve(json, pubspecConfig);
      if (data.isEmpty) continue;
      allContent += entry.value.generate(data, pubspecConfig);
    }
    if (allContent.files.isNotEmpty) return allContent;
    final content = ThemeColorGenerator().generate(
      json as Map<String, String>,
      pubspecConfig,
      themeInstanceName,
      isDefaultTheme,
    );
    return content;
  }
}
