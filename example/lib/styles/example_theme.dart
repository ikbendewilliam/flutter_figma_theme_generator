import 'package:flutter/material.dart';

import 'example_colors_theme_default.dart';
import 'example_colors_theme_light_mode.dart';

class ExampleTheme {
  static final _exampleColorsThemeDefault = ExampleColorsThemeDefault();
  static final _exampleColorsThemeLightMode = ExampleColorsThemeLightMode.instance;

  static ExampleColorsThemeDefault of(BuildContext context, {
    forceExampleColorsThemeDefault = false,
    forceExampleColorsThemeLightMode = false,
  }) {
    if (forceExampleColorsThemeDefault) return _exampleColorsThemeDefault;
    if (forceExampleColorsThemeLightMode) return _exampleColorsThemeLightMode;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _exampleColorsThemeDefault;
    return _exampleColorsThemeLightMode;
  }
}
