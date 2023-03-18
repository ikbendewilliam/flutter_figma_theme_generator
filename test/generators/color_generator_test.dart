import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/color_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testColorGenerator(String input, String output) {
    final generator = ColorGenerator();
    final result = generator.generate(jsonDecode(input.trim()) as Map<String, dynamic>, PubspecConfig(pubspecConfig));
    expect(result.files.entries.first.value, output);
  }

  group('Color generator', () {
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

class TestColors {
  static const neutralsGrey0 = Color(0xFF292929);
}
''';

const pubspecConfig = '''
name: test
''';
