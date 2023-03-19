import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeSource {
  ExampleColorsThemeSource._();

  static final instance = ExampleColorsThemeDefault(
    brandColoursGradientsLR: linear-gradient(90deg, {brand_colours.brand_c2.56} 0%, {brand_colours.brand_c1.48} 100%),
    brandColoursGradientsTB: linear-gradient(0deg, {brand_colours.brand_c1.48} 0%, {brand_colours.brand_c2.56} 100%),
  );
}
