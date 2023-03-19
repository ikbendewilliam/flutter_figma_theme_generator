import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeCoreSurface {
  ExampleColorsThemeLightModeCoreSurface._();

  static final instance = ExampleColorsThemeDefault(
    surfaceCanvasDefault: ExampleColors.brandColoursNeutrals100,
    surfaceCanvasSplash: ExampleColors.brandColoursGradientsTB,
    surfaceOnCanvasDefault01: ExampleColors.brandColoursNeutrals96,
    surfaceOnCanvasDefault02: ExampleColors.brandColoursNeutrals88,
    surfaceOnCanvasDefaultHighlight01: ExampleColors.brandColoursBrandC196,
    surfaceOnCanvasDefaultHighlight02: ExampleColors.brandColoursBrandC188,
  );
}
