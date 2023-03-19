import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeTabbar {
  ExampleColorsThemeLightModeTabbar._();

  static final instance = ExampleColorsThemeDefault(
    tabbarSurface: ExampleColors.surfaceCanvasDefault,
    tabbarTabLabelDefault: ExampleColors.copyTextFaded,
    tabbarTabIconDefault: ExampleColors.copyTextDefault,
    tabbarTabLabelActive: ExampleColors.brandColoursGradientsLR,
    tabbarTabIconActive: ExampleColors.brandColoursGradientsLR,
  );
}
