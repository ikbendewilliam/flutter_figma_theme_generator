import 'dart:convert';
import 'dart:io';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/resolvers/color_resolver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const directory = 'color_resolver';
  final resolver = ColorResolver();

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
      resultFile.writeAsStringSync(jsonEncode(result));

      expect(jsonEncode(result), expected);
    });
  }

  group('Color generator', () {
    test('HSL to HEX test', () {
      final generator = ColorResolver();
      expect(generator.hslToHex(0, 0, 0, 1), '0xFF000000');
      expect(generator.hslToHex(0, 100, 100, 1), '0xFFFFFFFF');
      expect(generator.hslToHex(0, 100, 50, 1), '0xFFFF0000');
      expect(generator.hslToHex(120, 100, 50, 1), '0xFF00FF00');
      expect(generator.hslToHex(240, 100, 50, 1), '0xFF0000FF');
      expect(generator.hslToHex(0, 0, 50, 1), '0xFF808080');
      expect(generator.hslToHex(30, 30, 30, 1), '0xFF634D36');
      expect(generator.hslToHex(0, 0, 0, 0), '0x00000000');
      expect(generator.hslToHex(0, 0, 0, 0.5), '0x80000000');
    });
  });
}
