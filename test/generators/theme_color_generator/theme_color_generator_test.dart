import 'dart:convert';
import 'dart:io';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const directory = 'theme_color_generator';
  final generator = ThemeColorGenerator();

  for (final testDir in Directory('test/generators/$directory').listSync()) {
    if (testDir is! Directory) continue;

    test('test', () {
      final input = File('${testDir.path}/resolved.json').readAsStringSync();
      final expected = File('${testDir.path}/expected.dart').readAsStringSync();
      final pubspecContent = File('${testDir.path}/pubspec.yaml').readAsStringSync();

      final data = Map<String, String>.from(jsonDecode(input));
      final pubspecConfig = PubspecConfig(pubspecContent);
      final result = generator.generate(data, pubspecConfig, testDir.path.split('/').last, true);
      final resultContent = result.files.entries.first.value;
      final resultFile = File('${testDir.path}/result.dart')..createSync();
      resultFile.writeAsStringSync(resultContent);

      expect(resultContent, expected);
    });
  }
}
