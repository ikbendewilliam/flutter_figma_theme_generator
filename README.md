## Assumptions

There are quite a few different ways to create the tokens file. This package assumes the following:
- You have typography containing text styles
- You have colors containing color styles
- You have a theme containing the colors and typography
- The colors use a hsla format
- The theme colors reference the colors

# TODO's
- [] Add support for gradients
- [] Add support for shadows

# TODO BELOW

## Usage

1. Add a dev_dependency to your pubspec.yaml
1. Add a theme folder in your project
1. Add your figma json exported files to the theme folder
1. Run the following command:

```
fvm flutter packages run flutter_figma_theme_generator
```

4. Use the [ExampleTheme].of(context) to access the theme data
5. (optional) Set the [ExampleTheme].userPrefferedThemeType to change the brightness of the theme (if applicable and the user has set a preference)
6. (optional) Set the [ExampleTheme].textThemeBuilder to change the default color of all and/or specific text styles

## Example

### Usage

```dart
final theme = ExampleTheme.of(context);
...
Text(
    '$_counter',
    style: theme.textStyles.titleExtraLarge,
),
```

### Generated file

```dart
class ExampleTheme {
  /// Set to override the returned theme
  static ThemeType? userPrefferedThemeType;

  /// Set to add logic in the creation of your themes.
  /// This can be used to override default colors for
  /// all or specific textStyles
  static ExampleTextTheme Function(ExampleColorsThemeDefault colors)? textThemeBuilder;

  static final _themeTypeMap = <ThemeType, ExampleTheme>{
    ThemeType.exampleColorsThemeDefaultType: _exampleColorsThemeDefault,
    ThemeType.exampleColorsThemeRedModeType: _exampleColorsThemeRedMode,
    ThemeType.exampleColorsThemeLightModeType: _exampleColorsThemeLightMode,
  };

  static final _exampleColorsThemeDefault = _createExampleTheme(ExampleColorsThemeDefault());
  static final _exampleColorsThemeRedMode = _createExampleTheme(ExampleColorsThemeRedMode.instance);
  static final _exampleColorsThemeLightMode = _createExampleTheme(ExampleColorsThemeLightMode.instance);

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
```

example of overriding the default color of all text styles and one specific text style. You can for example call this in your main method before the app starts.

```dart
void _setTextThemeBuilder() {
  ExampleTheme.textThemeBuilder = (colors) => ExampleTextTheme(
        allOverrides: TextStyle(
          color: colors.uIContentTextDefault,
        ),
        textRegularMediumOverrides: TextStyle(
          color: colors.uIContentTextSubtle,
        ),
      );
}
```
