import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeInputField {
  ExampleColorsThemeLightModeInputField._();

  static final instance = ExampleColorsThemeDefault(
    inputFieldTextLabelEnabled: ExampleColors.copyTextSubtle,
    inputFieldTextInputEnabled: ExampleColors.copyTextDefault,
    inputFieldTextPrefixEnabled: ExampleColors.copyTextSubtle,
    inputFieldTextPlaceholderEnabled: ExampleColors.copyTextFaded,
    inputFieldTextLabelFocus: ExampleColors.copyTextDefault,
    inputFieldTextInputFocus: ExampleColors.copyTextDefault,
    inputFieldTextPrefixFocus: ExampleColors.copyTextSubtle,
    inputFieldTextPlaceholderFocus: ExampleColors.copyTextFaded,
    inputFieldFieldSurfaceEnabled: ExampleColors.surfaceCanvasDefault,
    inputFieldFieldBorderEnabled: ExampleColors.borderDefault,
    inputFieldFieldSurfaceFocus: ExampleColors.surfaceCanvasDefault,
    inputFieldFieldBorderFocus: ExampleColors.brandColoursNeutrals16,
    inputFieldFieldCaret: ExampleColors.brandColoursGradientsTB,
    inputFieldFieldDivider: ExampleColors.borderDefault,
  );
}
