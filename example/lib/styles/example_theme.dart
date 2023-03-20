import 'package:flutter/material.dart';

import 'example_colors_theme_default.dart';

class ExampleTheme {
  /// Set to add logic in the creation of your themes.
  /// This can be used to override default colors for
  /// all or specific textStyles
  static dynamic Function(ExampleColorsThemeDefault colors)? textThemeBuilder;

  static final _exampleColorsThemeDefault = _createExampleTheme(ExampleColorsThemeDefault());

  final ExampleColorsThemeDefault colors;

  ExampleTheme(this.colors);

  static ExampleTheme _createExampleTheme(ExampleColorsThemeDefault colors) {
    return ExampleTheme(colors);
  }

  static ExampleTheme of(BuildContext context) => _exampleColorsThemeDefault;
}
