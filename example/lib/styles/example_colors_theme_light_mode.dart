import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightMode {
  ExampleColorsThemeLightMode._();

  static ExampleColorsThemeDefault instance = ExampleColorsThemeDefault(
    uIBgSplash: ExampleColors.neutralsBlue24,
    uIBgCanvas: ExampleColors.neutralsBlue100,
    uIBgCanvasBlock: ExampleColors.neutralsBlue24.withOpacity(0.64),
    uIBgOnimgBlurred: ExampleColors.neutralsBlue100.withOpacity(0.92),
    uIContentTextDefault: ExampleColors.neutralsBlue0,
    uIContentTextSubtle: ExampleColors.neutralsBlue24,
    uIContentTextFaded: ExampleColors.neutralsBlue40,
    uIContentTextSelected: ExampleColors.brandC132,
    uIContentSplashDefault: ExampleColors.brandC156,
    uIContentSplashFaded: ExampleColors.neutralsBlue24,
    uIActionDefault: ExampleColors.brandC156,
    uIActionOndefault: ExampleColors.brandC10,
    uIActionSubtle: ExampleColors.neutralsBlue40,
    uIActionDanger: ExampleColors.systemSemN32,
    uIBorderOnCanvas: ExampleColors.neutralsBlue80,
    componentTabbarBg: ExampleColors.neutralsBlue100.withOpacity(0.8),
    componentTabbarTabActive: ExampleColors.brandC156,
    componentTabbarTabInactive: ExampleColors.neutralsBlue40,
    componentCardHighlightBg: ExampleColors.systemSemW96,
    componentCardHighlightBorder: ExampleColors.systemSemW64,
    componentCardHighlightTextDefault: ExampleColors.systemSemW0,
    componentCardHighlightTextSubtle: ExampleColors.systemSemW24,
    componentCardHighlightActionSubtle: ExampleColors.systemSemW40,
  );
}
