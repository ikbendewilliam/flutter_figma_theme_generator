import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeBadge {
  ExampleColorsThemeLightModeBadge._();

  static final instance = ExampleColorsThemeDefault(
    badgeSurfaceDefault: ExampleColors.brandColoursGradientsLR,
    badgeLabelDefault: ExampleColors.brandColoursNeutrals100,
  );
}
