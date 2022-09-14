import 'package:flutter/material.dart';

import 'example_colors_theme_default.dart';
import 'example_colors_theme_red_mode.dart';
import 'example_colors_theme_light_mode.dart';
import 'example_text_theme.dart';


class ExampleTheme {
  /// Set to override the returned theme
  static ThemeType? userPrefferedThemeType;

  static final _themeTypeMap = <ThemeType, ExampleTheme>{
    ThemeType.exampleColorsThemeDefaultType: _exampleColorsThemeDefault,
    ThemeType.exampleColorsThemeRedModeType: _exampleColorsThemeRedMode,
    ThemeType.exampleColorsThemeLightModeType: _exampleColorsThemeLightMode,
  };

  static final _exampleColorsThemeDefault = ExampleTheme(ExampleColorsThemeDefault(), const ExampleTextTheme());
  static final _exampleColorsThemeRedMode = ExampleTheme(ExampleColorsThemeRedMode.instance, const ExampleTextTheme());
  static final _exampleColorsThemeLightMode = ExampleTheme(ExampleColorsThemeLightMode.instance, const ExampleTextTheme());

  final ExampleColorsThemeDefault colors;
  final ExampleTextTheme textStyles;

  ExampleTheme(this.colors, this.textStyles);

  static ExampleTheme of(BuildContext context, {
    bool forceDefault = false,
    bool forceRedMode = false,
    bool forceLightMode = false,
  }) {
    if (forceDefault) return _exampleColorsThemeDefault;
    if (forceRedMode) return _exampleColorsThemeRedMode;
    if (forceLightMode) return _exampleColorsThemeLightMode;
    if (userPrefferedThemeType != null) return _themeTypeMap[userPrefferedThemeType!]!;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _exampleColorsThemeDefault;
    return _exampleColorsThemeLightMode;
  }
}

enum ThemeType {
  exampleColorsThemeDefaultType,
  exampleColorsThemeRedModeType,
  exampleColorsThemeLightModeType,
}
