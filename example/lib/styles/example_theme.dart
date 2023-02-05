import 'package:flutter/material.dart';

import 'example_colors_theme_default.dart';
import 'example_colors_theme_light_mode.dart';
import 'example_colors_theme_red_mode.dart';
import 'example_text_theme.dart';

class ExampleTheme {
  /// Set to override the returned theme
  static ThemeType? userPrefferedThemeType;

  /// Set to add logic in the creation of your themes.
  /// This can be used to override default colors for
  /// all or specific textStyles
  static ExampleTextTheme Function(ExampleColorsThemeDefault colors)? textThemeBuilder;

  static final _themeTypeMap = <ThemeType, ExampleTheme>{
    ThemeType.exampleColorsThemeDefaultType: _exampleColorsThemeDefault,
    ThemeType.exampleColorsThemeLightModeType: _exampleColorsThemeLightMode,
    ThemeType.exampleColorsThemeRedModeType: _exampleColorsThemeRedMode,
  };

  static final _exampleColorsThemeDefault = _createExampleTheme(ExampleColorsThemeDefault());
  static final _exampleColorsThemeLightMode = _createExampleTheme(ExampleColorsThemeLightMode.instance);
  static final _exampleColorsThemeRedMode = _createExampleTheme(ExampleColorsThemeRedMode.instance);

  final ExampleColorsThemeDefault colors;
  final ExampleTextTheme textStyles;

  ExampleTheme(this.colors, this.textStyles);

  static ExampleTheme _createExampleTheme(ExampleColorsThemeDefault colors) {
    final textStyles = textThemeBuilder?.call(colors) ?? ExampleTextTheme();
    return ExampleTheme(colors, textStyles);
  }

  static ExampleTheme of(
    BuildContext context, {
    bool forceDefault = false,
    bool forceLightMode = false,
    bool forceRedMode = false,
  }) {
    if (forceDefault) return _exampleColorsThemeDefault;
    if (forceLightMode) return _exampleColorsThemeLightMode;
    if (forceRedMode) return _exampleColorsThemeRedMode;
    if (userPrefferedThemeType != null) return _themeTypeMap[userPrefferedThemeType!]!;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _exampleColorsThemeDefault;
    return _exampleColorsThemeLightMode;
  }
}

enum ThemeType {
  exampleColorsThemeDefaultType,
  exampleColorsThemeLightModeType,
  exampleColorsThemeRedModeType,
}
