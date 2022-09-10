import 'package:flutter/material.dart';

import 'example_colors.dart';

class ExampleColorsThemeDefault {
  final Color uIBgSplash;
  final Color uIBgCanvas;
  final Color uIBgSurface1;
  final Color uIBgCanvasBlock;
  final Color uIBgOnimgBlurred;
  final Color uIContentTextDefault;
  final Color uIContentTextSubtle;
  final Color uIContentTextFaded;
  final Color uIContentTextSelected;
  final Color uIContentSplashDefault;
  final Color uIContentSplashFaded;
  final Color uIActionDefault;
  final Color uIActionOndefault;
  final Color uIActionSubtle;
  final Color uIActionDanger;
  final Color uIBorderOnCanvas;
  final Color uIDividerOnCanvas;
  final Color componentTabbarBg;
  final Color componentTabbarTabActive;
  final Color componentTabbarTabInactive;
  final Color componentCardHighlightBg;
  final Color componentCardHighlightBorder;
  final Color componentCardHighlightTextDefault;
  final Color componentCardHighlightTextSubtle;
  final Color componentCardHighlightActionSubtle;
  final Color componentCardDefaultBg;
  final Color componentCardDefaultBorder;
  final Color componentCardDefaultTextDefault;
  final Color componentCardDefaultTextSubtle;
  final Color componentCardDefaultActionSubtle;

   ExampleColorsThemeDefault({
    uIBgSplash,
    uIBgCanvas,
    uIBgSurface1,
    uIBgCanvasBlock,
    uIBgOnimgBlurred,
    uIContentTextDefault,
    uIContentTextSubtle,
    uIContentTextFaded,
    uIContentTextSelected,
    uIContentSplashDefault,
    uIContentSplashFaded,
    uIActionDefault,
    uIActionOndefault,
    uIActionSubtle,
    uIActionDanger,
    uIBorderOnCanvas,
    uIDividerOnCanvas,
    componentTabbarBg,
    componentTabbarTabActive,
    componentTabbarTabInactive,
    componentCardHighlightBg,
    componentCardHighlightBorder,
    componentCardHighlightTextDefault,
    componentCardHighlightTextSubtle,
    componentCardHighlightActionSubtle,
    componentCardDefaultBg,
    componentCardDefaultBorder,
    componentCardDefaultTextDefault,
    componentCardDefaultTextSubtle,
    componentCardDefaultActionSubtle,
  })  : uIBgSplash = uIBgSplash ?? ExampleColors.neutralsBlue24,
        uIBgCanvas = uIBgCanvas ?? ExampleColors.neutralsBlue0,
        uIBgSurface1 = uIBgSurface1 ?? ExampleColors.neutralsBlue8,
        uIBgCanvasBlock = uIBgCanvasBlock ?? ExampleColors.neutralsBlue8.withOpacity(0.64),
        uIBgOnimgBlurred = uIBgOnimgBlurred ?? ExampleColors.neutralsBlue0.withOpacity(0.72),
        uIContentTextDefault = uIContentTextDefault ?? ExampleColors.neutralsBlue96,
        uIContentTextSubtle = uIContentTextSubtle ?? ExampleColors.neutralsBlue56,
        uIContentTextFaded = uIContentTextFaded ?? ExampleColors.neutralsBlue40,
        uIContentTextSelected = uIContentTextSelected ?? ExampleColors.brandC156,
        uIContentSplashDefault = uIContentSplashDefault ?? ExampleColors.brandC156,
        uIContentSplashFaded = uIContentSplashFaded ?? ExampleColors.neutralsBlue24,
        uIActionDefault = uIActionDefault ?? ExampleColors.brandC156,
        uIActionOndefault = uIActionOndefault ?? ExampleColors.brandC10,
        uIActionSubtle = uIActionSubtle ?? ExampleColors.neutralsBlue48,
        uIActionDanger = uIActionDanger ?? ExampleColors.systemSemN56,
        uIBorderOnCanvas = uIBorderOnCanvas ?? ExampleColors.neutralsBlue16,
        uIDividerOnCanvas = uIDividerOnCanvas ?? ExampleColors.neutralsBlue16,
        componentTabbarBg = componentTabbarBg ?? ExampleColors.neutralsBlue0.withOpacity(0.8),
        componentTabbarTabActive = componentTabbarTabActive ?? ExampleColors.brandC156,
        componentTabbarTabInactive = componentTabbarTabInactive ?? ExampleColors.neutralsBlue48,
        componentCardHighlightBg = componentCardHighlightBg ?? ExampleColors.systemSemW72,
        componentCardHighlightBorder = componentCardHighlightBorder ?? ExampleColors.neutralsBlue0,
        componentCardHighlightTextDefault = componentCardHighlightTextDefault ?? ExampleColors.systemSemW8,
        componentCardHighlightTextSubtle = componentCardHighlightTextSubtle ?? ExampleColors.systemSemW32,
        componentCardHighlightActionSubtle = componentCardHighlightActionSubtle ?? ExampleColors.systemSemW24,
        componentCardDefaultBg = componentCardDefaultBg ?? ExampleColors.neutralsBlue0,
        componentCardDefaultBorder = componentCardDefaultBorder ?? ExampleColors.neutralsBlue16,
        componentCardDefaultTextDefault = componentCardDefaultTextDefault ?? ExampleColors.neutralsBlue96,
        componentCardDefaultTextSubtle = componentCardDefaultTextSubtle ?? ExampleColors.neutralsBlue56,
        componentCardDefaultActionSubtle = componentCardDefaultActionSubtle ?? ExampleColors.neutralsBlue48;
}
