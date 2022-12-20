## Usage

1. Add a dev_dependency to your pubspec.yaml
1. Add a theme folder in your project
1. Add your figma json exported files to the theme folder
1. Run the following command:

```
fvm flutter packages run flutter_figma_theme_generator
```

4. Use the [ExampleTheme].of(context) to access the theme data
5. Set the [ExampleTheme].userPrefferedThemeType to change the brightness of the theme (if applicable and the user has set a preference)

## Example


### Usage
    
```dart
final theme = ExampleTheme.of(context);
...
Text(
    '$_counter',
    style: theme.textStyles.titleExtraLarge.copyWith(color: theme.colors.uIContentTextSubtle),
),
```

### Generated file

```dart
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
```