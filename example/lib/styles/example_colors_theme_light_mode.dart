import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightMode {
  ExampleColorsThemeLightMode._();

  static final instance = ExampleColorsThemeDefault(
    uIBgScreen: ExampleColors.neutralsBlue100,
    uIContentTextDefault: ExampleColors.neutralsBlue0,
    uIContentTextSubtle: ExampleColors.neutralsBlue24,
  );
}
