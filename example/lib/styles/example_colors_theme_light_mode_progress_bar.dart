import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeProgressBar {
  ExampleColorsThemeLightModeProgressBar._();

  static final instance = ExampleColorsThemeDefault(
    progressBarStepActive: ExampleColors.brandColoursGradientsLR,
    progressBarStepTodo: ExampleColors.brandColoursNeutrals80,
  );
}
