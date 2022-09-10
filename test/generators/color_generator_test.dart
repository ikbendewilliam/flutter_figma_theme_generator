import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/utils/color_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testColorGenerator(String input, String output) {
    final fontGenerator = ColorGenerator();
    final result = fontGenerator.generate(jsonDecode(input.trim()) as Map<String, dynamic>, PubspecConfig(pubspecConfig));
    expect(result.files.entries.first.value, output);
  }

  group('Color generator', () {
    test('HSL to HEX test', () {
      final generator = ColorGenerator();
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

    test('normal color generator test', () {
      testColorGenerator(input, output);
    });
  });
}

const input = '''
{
  "Colour palette": {
    "neutrals": {
      "grey": {
        "0": {
          "value": "hsla({neutrals.greyscale.hue}, {neutrals.greyscale.saturation}, 16%, 1)",
          "type": "color"
        }
      },
      "greyscale": {
        "hue": {
          "value": "0",
          "type": "Color-config"
        },
        "saturation": {
          "value": "0%",
          "type": "Color-config"
        }
      }
    }
  }
}
''';

const output = '''import 'package:flutter/material.dart';

class TestColorTheme {
  static const neutralsGrey0 = Color("#FF292929");
}
''';

const pubspecConfig = '''
name: test
''';
