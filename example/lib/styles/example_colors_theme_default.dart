import 'package:flutter/material.dart';

import 'example_colors.dart';

class ExampleColorsThemeDefault {
  final Color uIBgScreen;
  final Color uIContentTextDefault;
  final Color uIContentTextSubtle;
  final Color uIActionBg;

  ExampleColorsThemeDefault({
    Color? uIBgScreen,
    Color? uIContentTextDefault,
    Color? uIContentTextSubtle,
    Color? uIActionBg,
  })  : uIBgScreen = uIBgScreen ?? ExampleColors.neutralsBlue0,
        uIContentTextDefault = uIContentTextDefault ?? ExampleColors.neutralsBlue100,
        uIContentTextSubtle = uIContentTextSubtle ?? ExampleColors.neutralsBlue100,
        uIActionBg = uIActionBg ?? ExampleColors.brandC124;
}
