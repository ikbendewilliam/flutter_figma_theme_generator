import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeChoiceSelection {
  ExampleColorsThemeLightModeChoiceSelection._();

  static final instance = ExampleColorsThemeDefault(
    choiceSelectionCardSurfaceEnabled: ExampleColors.surfaceCanvasDefault,
    choiceSelectionCardBorderEnabled: ExampleColors.borderDefault,
    choiceSelectionCardLabelEnabled: ExampleColors.copyTextDefault,
    choiceSelectionCardSurfaceSelected: ExampleColors.brandColoursBrandC188,
    choiceSelectionCardBorderSelected: ExampleColors.brandColoursGradientsLR,
    choiceSelectionCardLabelEnable: ExampleColors.brandColoursBrandC148,
  );
}
