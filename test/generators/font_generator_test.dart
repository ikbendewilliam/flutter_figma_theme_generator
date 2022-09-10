import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/utils/font_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testFontGenerator(String input, String output) {
    final fontGenerator = FontGenerator();
    final result = fontGenerator.generate(jsonDecode(input.trim()) as Map<String, dynamic>, PubspecConfig(pubspecConfig));
    expect(result.files.entries.first.value, output);
  }

  group('Font generator', () {
    test('normal font generator test', () {
      testFontGenerator(input, output);
    });
  });
}

const input = '''
{
  "Typography": {
    "title-weight": {
      "value": "Bold",
      "type": "fontWeights"
    },
    "title-font": {
      "value": "Playfair Display",
      "type": "fontFamilies"
    },
    "title": {
      "micro": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "14",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      }
    }
  }
}
''';

const output = '''import 'package:flutter/material.dart';

class TestTextTheme {
  final TextStyle titleMicro;

  const TestTextTheme({
    required this.titleMicro,
  });
}
''';

const pubspecConfig = '''
name: test
''';
