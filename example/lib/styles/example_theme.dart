import 'package:flutter/material.dart';

import 'example_colors_theme_default.dart';
import 'example_colors_theme_light_mode.dart';
import 'example_text_theme.dart';


class ExampleTheme {
  static final _exampleColorsThemeDefault = ExampleTheme(ExampleColorsThemeDefault(), const ExampleTextTheme());
  static final _exampleColorsThemeLightMode = ExampleTheme(ExampleColorsThemeLightMode.instance, const ExampleTextTheme());

  final ExampleColorsThemeDefault colors;
  final ExampleTextTheme fonts;

  ExampleTheme(this.colors, this.fonts);

  static ExampleTheme of(BuildContext context, {
    forceDefault = false,
    forceLightMode = false,
  }) {
    if (forceDefault) return _exampleColorsThemeDefault;
    if (forceLightMode) return _exampleColorsThemeLightMode;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _exampleColorsThemeDefault;
    return _exampleColorsThemeLightMode;
  }
}
