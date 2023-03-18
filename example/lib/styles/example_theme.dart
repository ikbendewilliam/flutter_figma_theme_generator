import 'package:flutter/material.dart';


class ExampleTheme {
  /// Set to add logic in the creation of your themes.
  /// This can be used to override default colors for
  /// all or specific textStyles
  static dynamic Function(Null colors)? textThemeBuilder;

  static final _null = _createExampleTheme(Null());

  final Null colors;

  ExampleTheme(this.colors);

  static ExampleTheme _createExampleTheme(Null colors) {
    return ExampleTheme(colors);
  }

  static ExampleTheme of(
    BuildContext context, {
  }) {
    if (userPrefferedThemeType != null) return _themeTypeMap[userPrefferedThemeType!]!;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _null;
    return _null;
  }
}

enum ThemeType {
}
