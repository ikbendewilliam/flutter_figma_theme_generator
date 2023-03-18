import 'dart:convert';
import 'dart:io';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/resolvers/typography_resolver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const directory = 'typography_resolver';
  final resolver = TypographyResolver();

  for (final testDir in Directory('test/resolvers/$directory').listSync()) {
    if (testDir is! Directory) continue;

    test('test', () {
      final input = File('${testDir.path}/tokens.json').readAsStringSync();
      final expected = File('${testDir.path}/expected.json').readAsStringSync();
      final pubspecContent = File('${testDir.path}/pubspec.yaml').readAsStringSync();

      final data = jsonDecode(input) as Map<String, dynamic>;
      final pubspecConfig = PubspecConfig(pubspecContent);
      final result = resolver.resolve(data, pubspecConfig);
      final resultFile = File('${testDir.path}/result.json')..createSync();
      resultFile.writeAsStringSync(jsonEncode(result.map((key, value) => MapEntry(key, value.toJson()))));

      expect(jsonEncode(result), expected);
    });
  }
}