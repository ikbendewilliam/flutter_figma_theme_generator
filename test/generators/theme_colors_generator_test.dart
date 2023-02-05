import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/theme_colors_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testColorGenerator(String input, String output) {
    final fontGenerator = ThemeColorsGenerator();
    final result = fontGenerator.generate(
        jsonDecode(input.trim()) as Map<String, dynamic>,
        PubspecConfig(pubspecConfig),
        true);
    expect(result.files.entries.first.value, output);
  }

  group('Theme color generator', () {
    test('normal theme color generator test', () {
      testColorGenerator(input, output);
    });
  });
}

const input = '''
{
  "Dark mode": {
    "UI": {
      "bg": {
        "splash": {
          "value": "{neutrals.blue.24}",
          "type": "color"
        },
        "canvas": {
          "value": "{neutrals.blue.0}",
          "type": "color"
        },
        "surface1": {
          "value": "{neutrals.blue.8}",
          "type": "color"
        },
        "canvas-block": {
          "value": "rgba({neutrals.blue.8}, .64)",
          "type": "color"
        },
        "onimg-blurred": {
          "value": "rgba({UI.bg.canvas}, .72)",
          "type": "color"
        }
      },
      "content": {
        "text": {
          "default": {
            "value": "{neutrals.blue.96}",
            "type": "color"
          },
          "subtle": {
            "value": "{neutrals.blue.56}",
            "type": "color"
          },
          "faded": {
            "value": "{neutrals.blue.40}",
            "type": "color"
          },
          "selected": {
            "value": "{brand.c1.56}",
            "type": "color"
          }
        },
        "splash": {
          "default": {
            "value": "{brand.c1.56}",
            "type": "color"
          },
          "faded": {
            "value": "{UI.bg.splash}",
            "type": "color"
          }
        }
      },
      "action": {
        "default": {
          "value": "{brand.c1.56}",
          "type": "color"
        },
        "ondefault": {
          "value": "{brand.c1.0}",
          "type": "color"
        },
        "subtle": {
          "value": "{neutrals.blue.48}",
          "type": "color"
        },
        "danger": {
          "value": "{system.sem-n.56}",
          "type": "color"
        }
      },
      "border": {
        "onCanvas": {
          "value": "{neutrals.blue.16}",
          "type": "color"
        }
      },
      "divider": {
        "onCanvas": {
          "value": "{neutrals.blue.16}",
          "type": "color"
        }
      }
    }
  }
}
''';

const output = '''import 'package:flutter/material.dart';

import 'test_colors.dart';

class TestColorsThemeDefault {
  final Color uIBgSplash;
  final Color uIBgCanvas;
  final Color uIBgSurface1;
  final Color uIBgCanvasBlock;
  final Color uIBgOnimgBlurred;
  final Color uIContentTextDefault;
  final Color uIContentTextSubtle;
  final Color uIContentTextFaded;
  final Color uIContentTextSelected;
  final Color uIContentSplashDefault;
  final Color uIContentSplashFaded;
  final Color uIActionDefault;
  final Color uIActionOndefault;
  final Color uIActionSubtle;
  final Color uIActionDanger;
  final Color uIBorderOnCanvas;
  final Color uIDividerOnCanvas;

  TestColorsThemeDefault({
    Color? uIBgSplash,
    Color? uIBgCanvas,
    Color? uIBgSurface1,
    Color? uIBgCanvasBlock,
    Color? uIBgOnimgBlurred,
    Color? uIContentTextDefault,
    Color? uIContentTextSubtle,
    Color? uIContentTextFaded,
    Color? uIContentTextSelected,
    Color? uIContentSplashDefault,
    Color? uIContentSplashFaded,
    Color? uIActionDefault,
    Color? uIActionOndefault,
    Color? uIActionSubtle,
    Color? uIActionDanger,
    Color? uIBorderOnCanvas,
    Color? uIDividerOnCanvas,
  })  : uIBgSplash = uIBgSplash ?? TestColors.neutralsBlue24,
        uIBgCanvas = uIBgCanvas ?? TestColors.neutralsBlue0,
        uIBgSurface1 = uIBgSurface1 ?? TestColors.neutralsBlue8,
        uIBgCanvasBlock = uIBgCanvasBlock ?? TestColors.neutralsBlue8.withOpacity(0.64),
        uIBgOnimgBlurred = uIBgOnimgBlurred ?? TestColors.neutralsBlue0.withOpacity(0.72),
        uIContentTextDefault = uIContentTextDefault ?? TestColors.neutralsBlue96,
        uIContentTextSubtle = uIContentTextSubtle ?? TestColors.neutralsBlue56,
        uIContentTextFaded = uIContentTextFaded ?? TestColors.neutralsBlue40,
        uIContentTextSelected = uIContentTextSelected ?? TestColors.brandC156,
        uIContentSplashDefault = uIContentSplashDefault ?? TestColors.brandC156,
        uIContentSplashFaded = uIContentSplashFaded ?? TestColors.neutralsBlue24,
        uIActionDefault = uIActionDefault ?? TestColors.brandC156,
        uIActionOndefault = uIActionOndefault ?? TestColors.brandC10,
        uIActionSubtle = uIActionSubtle ?? TestColors.neutralsBlue48,
        uIActionDanger = uIActionDanger ?? TestColors.systemSemN56,
        uIBorderOnCanvas = uIBorderOnCanvas ?? TestColors.neutralsBlue16,
        uIDividerOnCanvas = uIDividerOnCanvas ?? TestColors.neutralsBlue16;
}
''';

const pubspecConfig = '''
name: test
''';
