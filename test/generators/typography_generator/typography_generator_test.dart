import 'dart:convert';
import 'dart:io';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
import 'package:flutter_figma_theme_generator/model/text_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const directory = 'typography_generator';
  final generator = TypographyGenerator();

  for (final testDir in Directory('test/generators/$directory').listSync()) {
    if (testDir is! Directory) continue;

    test('test', () {
      final input = File('${testDir.path}/resolved.json').readAsStringSync();
      final expected = File('${testDir.path}/expected.dart').readAsStringSync();
      final pubspecContent = File('${testDir.path}/pubspec.yaml').readAsStringSync();

      final data = (jsonDecode(input) as Map<String, dynamic>).map((key, value) => MapEntry(key, TextStyle.fromJson(value as Map<String, dynamic>)));
      final pubspecConfig = PubspecConfig(pubspecContent);
      final result = generator.generate(data, pubspecConfig);
      final resultContent = result.files.entries.first.value;
      final resultFile = File('${testDir.path}/result.dart')..createSync();
      resultFile.writeAsStringSync(resultContent);

      expect(resultContent, expected);
    });
  }
}
