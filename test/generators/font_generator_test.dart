import 'dart:convert';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testFontGenerator(String input, String output) {
    final fontGenerator = FontGenerator();
    final result = fontGenerator.generate(
        jsonDecode(input.trim()) as Map<String, dynamic>,
        PubspecConfig(pubspecConfig));
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

class TestTextTheme {
  late final TextStyle titleMicro;
  late final TextStyle titleTiny;
  late final TextStyle titleExtraSmall;
  late final TextStyle titleSmall;
  late final TextStyle titleMedium;
  late final TextStyle titleLarge;
  late final TextStyle titleExtraLarge;
  late final TextStyle titleDisplaySmall;
  late final TextStyle titleDisplayMedium;
  late final TextStyle titleDisplayLarge;
  late final TextStyle textRegularMicro;
  late final TextStyle textRegularTiny;
  late final TextStyle textRegularExtraSmall;
  late final TextStyle textRegularSmall;
  late final TextStyle textRegularMedium;
  late final TextStyle textRegularLarge;
  late final TextStyle textBoldMicro;
  late final TextStyle textBoldTiny;
  late final TextStyle textBoldExtraSmall;
  late final TextStyle textBoldSmall;
  late final TextStyle textBoldMedium;
  late final TextStyle textBoldLarge;

  TestTextTheme({
    TextStyle? allOverrides,
    TextStyle? titleMicroOverrides,
    TextStyle? titleTinyOverrides,
    TextStyle? titleExtraSmallOverrides,
    TextStyle? titleSmallOverrides,
    TextStyle? titleMediumOverrides,
    TextStyle? titleLargeOverrides,
    TextStyle? titleExtraLargeOverrides,
    TextStyle? titleDisplaySmallOverrides,
    TextStyle? titleDisplayMediumOverrides,
    TextStyle? titleDisplayLargeOverrides,
    TextStyle? textRegularMicroOverrides,
    TextStyle? textRegularTinyOverrides,
    TextStyle? textRegularExtraSmallOverrides,
    TextStyle? textRegularSmallOverrides,
    TextStyle? textRegularMediumOverrides,
    TextStyle? textRegularLargeOverrides,
    TextStyle? textBoldMicroOverrides,
    TextStyle? textBoldTinyOverrides,
    TextStyle? textBoldExtraSmallOverrides,
    TextStyle? textBoldSmallOverrides,
    TextStyle? textBoldMediumOverrides,
    TextStyle? textBoldLargeOverrides,
  }) {
    titleMicro = TextStyle(
      inherit: titleMicroOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleMicroOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleMicroOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleMicroOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleMicroOverrides?.fontSize ?? allOverrides?.fontSize ?? 14.0,
      fontWeight: titleMicroOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleMicroOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleMicroOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleMicroOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleMicroOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleMicroOverrides?.height ?? allOverrides?.height,
      decoration: titleMicroOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleMicroOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleMicroOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleMicroOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleMicroOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleMicroOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleMicroOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleMicroOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleMicroOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleTiny = TextStyle(
      inherit: titleTinyOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleTinyOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleTinyOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleTinyOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleTinyOverrides?.fontSize ?? allOverrides?.fontSize ?? 16.0,
      fontWeight: titleTinyOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleTinyOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleTinyOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleTinyOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleTinyOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleTinyOverrides?.height ?? allOverrides?.height,
      decoration: titleTinyOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleTinyOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleTinyOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleTinyOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleTinyOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleTinyOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleTinyOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleTinyOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleTinyOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleExtraSmall = TextStyle(
      inherit: titleExtraSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleExtraSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleExtraSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleExtraSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleExtraSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 18.0,
      fontWeight: titleExtraSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleExtraSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleExtraSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleExtraSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleExtraSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleExtraSmallOverrides?.height ?? allOverrides?.height,
      decoration: titleExtraSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleExtraSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleExtraSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleExtraSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleExtraSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleExtraSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleExtraSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleExtraSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleExtraSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleSmall = TextStyle(
      inherit: titleSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 20.0,
      fontWeight: titleSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleSmallOverrides?.height ?? allOverrides?.height,
      decoration: titleSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleMedium = TextStyle(
      inherit: titleMediumOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleMediumOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleMediumOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleMediumOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleMediumOverrides?.fontSize ?? allOverrides?.fontSize ?? 22.0,
      fontWeight: titleMediumOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleMediumOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleMediumOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleMediumOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleMediumOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleMediumOverrides?.height ?? allOverrides?.height,
      decoration: titleMediumOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleMediumOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleMediumOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleMediumOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleMediumOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleMediumOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleMediumOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleMediumOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleMediumOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleLarge = TextStyle(
      inherit: titleLargeOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleLargeOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleLargeOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleLargeOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleLargeOverrides?.fontSize ?? allOverrides?.fontSize ?? 24.0,
      fontWeight: titleLargeOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleLargeOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleLargeOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleLargeOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleLargeOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleLargeOverrides?.height ?? allOverrides?.height,
      decoration: titleLargeOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleLargeOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleLargeOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleLargeOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleLargeOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleLargeOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleLargeOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleLargeOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleLargeOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleExtraLarge = TextStyle(
      inherit: titleExtraLargeOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleExtraLargeOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleExtraLargeOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleExtraLargeOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleExtraLargeOverrides?.fontSize ?? allOverrides?.fontSize ?? 28.0,
      fontWeight: titleExtraLargeOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleExtraLargeOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleExtraLargeOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleExtraLargeOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleExtraLargeOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleExtraLargeOverrides?.height ?? allOverrides?.height,
      decoration: titleExtraLargeOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleExtraLargeOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleExtraLargeOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleExtraLargeOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleExtraLargeOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleExtraLargeOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleExtraLargeOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleExtraLargeOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleExtraLargeOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleDisplaySmall = TextStyle(
      inherit: titleDisplaySmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleDisplaySmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleDisplaySmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleDisplaySmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleDisplaySmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 32.0,
      fontWeight: titleDisplaySmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleDisplaySmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleDisplaySmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleDisplaySmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleDisplaySmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleDisplaySmallOverrides?.height ?? allOverrides?.height,
      decoration: titleDisplaySmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleDisplaySmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleDisplaySmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleDisplaySmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleDisplaySmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleDisplaySmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleDisplaySmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleDisplaySmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleDisplaySmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleDisplayMedium = TextStyle(
      inherit: titleDisplayMediumOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleDisplayMediumOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleDisplayMediumOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleDisplayMediumOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleDisplayMediumOverrides?.fontSize ?? allOverrides?.fontSize ?? 36.0,
      fontWeight: titleDisplayMediumOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleDisplayMediumOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleDisplayMediumOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleDisplayMediumOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleDisplayMediumOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleDisplayMediumOverrides?.height ?? allOverrides?.height,
      decoration: titleDisplayMediumOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleDisplayMediumOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleDisplayMediumOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleDisplayMediumOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleDisplayMediumOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleDisplayMediumOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleDisplayMediumOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleDisplayMediumOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleDisplayMediumOverrides?.overflow ?? allOverrides?.overflow,
    );
    titleDisplayLarge = TextStyle(
      inherit: titleDisplayLargeOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: titleDisplayLargeOverrides?.color ?? allOverrides?.color,
      backgroundColor: titleDisplayLargeOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: titleDisplayLargeOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Playfair Display",
      fontSize: titleDisplayLargeOverrides?.fontSize ?? allOverrides?.fontSize ?? 40.0,
      fontWeight: titleDisplayLargeOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.bold,
      fontStyle: titleDisplayLargeOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: titleDisplayLargeOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: titleDisplayLargeOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: titleDisplayLargeOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: titleDisplayLargeOverrides?.height ?? allOverrides?.height,
      decoration: titleDisplayLargeOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: titleDisplayLargeOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: titleDisplayLargeOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: titleDisplayLargeOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: titleDisplayLargeOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: titleDisplayLargeOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: titleDisplayLargeOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: titleDisplayLargeOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: titleDisplayLargeOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularMicro = TextStyle(
      inherit: textRegularMicroOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularMicroOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularMicroOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularMicroOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularMicroOverrides?.fontSize ?? allOverrides?.fontSize ?? 10.0,
      fontWeight: textRegularMicroOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularMicroOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularMicroOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularMicroOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularMicroOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularMicroOverrides?.height ?? allOverrides?.height ?? 1.4,
      decoration: textRegularMicroOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularMicroOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularMicroOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularMicroOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularMicroOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularMicroOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularMicroOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularMicroOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularMicroOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularTiny = TextStyle(
      inherit: textRegularTinyOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularTinyOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularTinyOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularTinyOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularTinyOverrides?.fontSize ?? allOverrides?.fontSize ?? 11.0,
      fontWeight: textRegularTinyOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularTinyOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularTinyOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularTinyOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularTinyOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularTinyOverrides?.height ?? allOverrides?.height ?? 1.4545454545454546,
      decoration: textRegularTinyOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularTinyOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularTinyOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularTinyOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularTinyOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularTinyOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularTinyOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularTinyOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularTinyOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularExtraSmall = TextStyle(
      inherit: textRegularExtraSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularExtraSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularExtraSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularExtraSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularExtraSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 12.0,
      fontWeight: textRegularExtraSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularExtraSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularExtraSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularExtraSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularExtraSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularExtraSmallOverrides?.height ?? allOverrides?.height ?? 1.3333333333333333,
      decoration: textRegularExtraSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularExtraSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularExtraSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularExtraSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularExtraSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularExtraSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularExtraSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularExtraSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularExtraSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularSmall = TextStyle(
      inherit: textRegularSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 14.0,
      fontWeight: textRegularSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularSmallOverrides?.height ?? allOverrides?.height ?? 1.5714285714285714,
      decoration: textRegularSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularMedium = TextStyle(
      inherit: textRegularMediumOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularMediumOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularMediumOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularMediumOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularMediumOverrides?.fontSize ?? allOverrides?.fontSize ?? 16.0,
      fontWeight: textRegularMediumOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularMediumOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularMediumOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularMediumOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularMediumOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularMediumOverrides?.height ?? allOverrides?.height ?? 1.5,
      decoration: textRegularMediumOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularMediumOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularMediumOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularMediumOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularMediumOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularMediumOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularMediumOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularMediumOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularMediumOverrides?.overflow ?? allOverrides?.overflow,
    );
    textRegularLarge = TextStyle(
      inherit: textRegularLargeOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textRegularLargeOverrides?.color ?? allOverrides?.color,
      backgroundColor: textRegularLargeOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textRegularLargeOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textRegularLargeOverrides?.fontSize ?? allOverrides?.fontSize ?? 18.0,
      fontWeight: textRegularLargeOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w400,
      fontStyle: textRegularLargeOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textRegularLargeOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textRegularLargeOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textRegularLargeOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textRegularLargeOverrides?.height ?? allOverrides?.height ?? 1.5555555555555556,
      decoration: textRegularLargeOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textRegularLargeOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textRegularLargeOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textRegularLargeOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textRegularLargeOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textRegularLargeOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textRegularLargeOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textRegularLargeOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textRegularLargeOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldMicro = TextStyle(
      inherit: textBoldMicroOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldMicroOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldMicroOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldMicroOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldMicroOverrides?.fontSize ?? allOverrides?.fontSize ?? 10.0,
      fontWeight: textBoldMicroOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldMicroOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldMicroOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldMicroOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldMicroOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldMicroOverrides?.height ?? allOverrides?.height ?? 1.4,
      decoration: textBoldMicroOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldMicroOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldMicroOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldMicroOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldMicroOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldMicroOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldMicroOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldMicroOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldMicroOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldTiny = TextStyle(
      inherit: textBoldTinyOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldTinyOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldTinyOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldTinyOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldTinyOverrides?.fontSize ?? allOverrides?.fontSize ?? 11.0,
      fontWeight: textBoldTinyOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldTinyOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldTinyOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldTinyOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldTinyOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldTinyOverrides?.height ?? allOverrides?.height ?? 1.4545454545454546,
      decoration: textBoldTinyOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldTinyOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldTinyOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldTinyOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldTinyOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldTinyOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldTinyOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldTinyOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldTinyOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldExtraSmall = TextStyle(
      inherit: textBoldExtraSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldExtraSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldExtraSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldExtraSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldExtraSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 12.0,
      fontWeight: textBoldExtraSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldExtraSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldExtraSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldExtraSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldExtraSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldExtraSmallOverrides?.height ?? allOverrides?.height ?? 1.3333333333333333,
      decoration: textBoldExtraSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldExtraSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldExtraSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldExtraSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldExtraSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldExtraSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldExtraSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldExtraSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldExtraSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldSmall = TextStyle(
      inherit: textBoldSmallOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldSmallOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldSmallOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldSmallOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldSmallOverrides?.fontSize ?? allOverrides?.fontSize ?? 14.0,
      fontWeight: textBoldSmallOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldSmallOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldSmallOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldSmallOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldSmallOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldSmallOverrides?.height ?? allOverrides?.height ?? 1.5714285714285714,
      decoration: textBoldSmallOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldSmallOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldSmallOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldSmallOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldSmallOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldSmallOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldSmallOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldSmallOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldSmallOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldMedium = TextStyle(
      inherit: textBoldMediumOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldMediumOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldMediumOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldMediumOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldMediumOverrides?.fontSize ?? allOverrides?.fontSize ?? 16.0,
      fontWeight: textBoldMediumOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldMediumOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldMediumOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldMediumOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldMediumOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldMediumOverrides?.height ?? allOverrides?.height ?? 1.5,
      decoration: textBoldMediumOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldMediumOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldMediumOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldMediumOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldMediumOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldMediumOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldMediumOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldMediumOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldMediumOverrides?.overflow ?? allOverrides?.overflow,
    );
    textBoldLarge = TextStyle(
      inherit: textBoldLargeOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textBoldLargeOverrides?.color ?? allOverrides?.color,
      backgroundColor: textBoldLargeOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textBoldLargeOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "Heebo",
      fontSize: textBoldLargeOverrides?.fontSize ?? allOverrides?.fontSize ?? 18.0,
      fontWeight: textBoldLargeOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textBoldLargeOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textBoldLargeOverrides?.letterSpacing ?? allOverrides?.letterSpacing ?? 0.0,
      wordSpacing: textBoldLargeOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textBoldLargeOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textBoldLargeOverrides?.height ?? allOverrides?.height ?? 1.5555555555555556,
      decoration: textBoldLargeOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textBoldLargeOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textBoldLargeOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textBoldLargeOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textBoldLargeOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textBoldLargeOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textBoldLargeOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textBoldLargeOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textBoldLargeOverrides?.overflow ?? allOverrides?.overflow,
    );
  }
}
''';

const pubspecConfig = '''
name: test
''';
