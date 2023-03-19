import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeButton {
  ExampleColorsThemeLightModeButton._();

  static final instance = ExampleColorsThemeDefault(
    buttonAlternativeSurfaceEnabled: ExampleColors.surfaceCanvasDefault,
    buttonAlternativeBorderEnabled: ExampleColors.brandColoursNeutrals16,
    buttonAlternativeLabelEnabled: ExampleColors.brandColoursNeutrals16,
    buttonSubtleLabelEnabled: ExampleColors.brandColoursNeutrals16,
    buttonDefaultSurfaceEnabled: ExampleColors.brandColoursGradientsLR,
    buttonDefaultLabelEnabled: ExampleColors.brandColoursNeutrals100,
  );
}
