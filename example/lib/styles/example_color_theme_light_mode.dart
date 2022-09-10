import 'example_colors.dart';

import 'example_color_theme_default.dart';

class ExampleColorThemeLightMode extends ExampleColorsThemeDefault {
  const ExampleColorThemeLightMode()
      : super(
          uIBgSplash: ExampleColors.neutralsBlue24,
          uIBgCanvas: ExampleColors.neutralsBlue100,
          uIBgCanvasBlock: rgba({neutrals.blue.24}, .64),
          uIBgOnimgBlurred: rgba({UI.bg.canvas}, .92),
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
          componentTabbarBg: rgba({UI.bg.canvas}, .8),
          componentTabbarTabActive: ExampleColors.brandC156,
          componentTabbarTabInactive: ExampleColors.neutralsBlue40,
          componentCardHighlightBg: ExampleColors.systemSemW96,
          componentCardHighlightBorder: ExampleColors.systemSemW64,
          componentCardHighlightTextDefault: ExampleColors.systemSemW0,
          componentCardHighlightTextSubtle: ExampleColors.systemSemW24,
          componentCardHighlightActionSubtle: ExampleColors.systemSemW40,
        );
}
