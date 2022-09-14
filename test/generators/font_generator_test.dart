import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
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
      },
      "tiny": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "16",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "extra-small": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "18",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "small": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "20",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "medium": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "22",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "large": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "24",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "extra-large": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "28",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "display-small": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "32",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "display-medium": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "36",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      },
      "display-large": {
        "value": {
          "fontFamily": "{title-font}",
          "fontWeight": "{title-weight}",
          "fontSize": "40",
          "lineHeight": "AUTO",
          "letterSpacing": "0%",
          "paragraphSpacing": "0",
          "textDecoration": "None",
          "textCase": "As typed"
        },
        "type": "typography"
      }
    },
    "text-font": {
      "value": "Heebo",
      "type": "fontFamilies"
    },
    "text": {
      "regular": {
        "micro": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.micro}",
            "lineHeight": "round(({text.size.micro}*{lineheight.text-narrow})/2)*2",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "tiny": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.tiny}",
            "lineHeight": "(round(({text.size.tiny}*{lineheight.text-narrow})/2)*2)",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "extra-small": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.extra-small}",
            "lineHeight": "round(({text.size.extra-small}*{lineheight.text-narrow})/2)*2",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "small": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.small}",
            "lineHeight": "round(({text.size.small}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "medium": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.medium}",
            "lineHeight": "round(({text.size.medium}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.2x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "large": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-regular}",
            "fontSize": "{text.size.large}",
            "lineHeight": "round(({text.size.large}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.2x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        }
      },
      "size": {
        "micro": {
          "value": "round({text.size.tiny}/{text-scale})",
          "type": "fontSizes"
        },
        "tiny": {
          "value": "round({text.size.extra-small}/{text-scale})",
          "type": "fontSizes"
        },
        "extra-small": {
          "value": "round({text.size.small}/{text-scale})",
          "type": "fontSizes"
        },
        "small": {
          "value": "round({text.size.medium}/{text-scale})",
          "type": "fontSizes"
        },
        "medium": {
          "value": "{text-base-size}",
          "type": "fontSizes"
        },
        "large": {
          "value": "round({text.size.medium}*{text-scale})",
          "type": "fontSizes"
        }
      },
      "bold": {
        "micro": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.micro}",
            "lineHeight": "round(({text.size.micro}*{lineheight.text-narrow})/2)*2",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "tiny": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.tiny}",
            "lineHeight": "(round(({text.size.tiny}*{lineheight.text-narrow})/2)*2)",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "extra-small": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.extra-small}",
            "lineHeight": "round(({text.size.extra-small}*{lineheight.text-narrow})/2)*2",
            "letterSpacing": "0",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "small": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.small}",
            "lineHeight": "round(({text.size.small}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.1x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "medium": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.medium}",
            "lineHeight": "round(({text.size.medium}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.2x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        },
        "large": {
          "value": {
            "fontFamily": "{text-font}",
            "fontWeight": "{text-weight-bold}",
            "fontSize": "{text.size.large}",
            "lineHeight": "round(({text.size.large}*{lineheight.text})/2)*2",
            "letterSpacing": "0%",
            "paragraphSpacing": "{paragraph.spacing.2x}",
            "textDecoration": "None",
            "textCase": "As typed"
          },
          "type": "typography"
        }
      }
    },
    "text-weight-regular": {
      "value": "Regular",
      "type": "fontWeights"
    },
    "text-weight-bold": {
      "value": "Medium",
      "type": "fontWeights"
    },
    "text-scale": {
      "value": "1.125",
      "type": "fontSizes"
    },
    "text-base-size": {
      "value": "16",
      "type": "fontSizes"
    },
    "lineheight": {
      "text": {
        "value": "1.5",
        "type": "other"
      },
      "text-narrow": {
        "value": "1.4",
        "type": "other"
      }
    },
    "p-spacing-base-unit": {
      "value": "4",
      "type": "paragraphSpacing"
    },
    "paragraph": {
      "spacing": {
        "1x": {
          "value": "{p-spacing-base-unit}",
          "type": "paragraphSpacing"
        },
        "2x": {
          "value": "{p-spacing-base-unit}*2",
          "type": "paragraphSpacing"
        }
      }
    }
  }
}
''';

const output = '''import 'package:flutter/material.dart';

class ExampleTextTheme {
  final TextStyle titleMicro;
  final TextStyle titleTiny;
  final TextStyle titleExtraSmall;
  final TextStyle titleSmall;
  final TextStyle titleMedium;
  final TextStyle titleLarge;
  final TextStyle titleExtraLarge;
  final TextStyle titleDisplaySmall;
  final TextStyle titleDisplayMedium;
  final TextStyle titleDisplayLarge;
  final TextStyle textRegularMicro;
  final TextStyle textRegularTiny;
  final TextStyle textRegularExtraSmall;
  final TextStyle textRegularSmall;
  final TextStyle textRegularMedium;
  final TextStyle textRegularLarge;
  final TextStyle textBoldMicro;
  final TextStyle textBoldTiny;
  final TextStyle textBoldExtraSmall;
  final TextStyle textBoldSmall;
  final TextStyle textBoldMedium;
  final TextStyle textBoldLarge;

  const ExampleTextTheme()
      : titleMicro = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 14.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleTiny = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 16.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleExtraSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 18.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleMedium = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 22.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleLarge = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 24.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleExtraLarge = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 28.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleDisplaySmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 32.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleDisplayMedium = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 36.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        titleDisplayLarge = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Playfair Display", fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: null, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularMicro = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 10.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.4, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularTiny = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 11.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.4545454545454546, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularExtraSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 12.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.3333333333333333, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 14.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5714285714285714, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularMedium = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 16.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textRegularLarge = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 18.0, fontWeight: FontWeight.w400, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5555555555555556, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldMicro = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 10.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.4, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldTiny = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 11.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.4545454545454546, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldExtraSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 12.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.3333333333333333, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldSmall = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 14.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5714285714285714, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldMedium = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 16.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null),
        textBoldLarge = const TextStyle(inherit: true, color: null, backgroundColor: null, fontFamily: "Heebo", fontSize: 18.0, fontWeight: FontWeight.w500, fontStyle: null, letterSpacing: 0.0, wordSpacing: null, textBaseline: null, height: 1.5555555555555556, decoration: null, decorationColor: null, decorationStyle: null, decorationThickness: null, debugLabel: null, shadows: null, fontFeatures: null, fontVariations: null, overflow: null);
}
''';

const pubspecConfig = '''
name: test
''';
