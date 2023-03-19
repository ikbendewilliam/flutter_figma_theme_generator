import 'package:flutter/material.dart';

class ExampleTextTheme {
  late final TextStyle textTabbarLabel;

  ExampleTextTheme({
    TextStyle? allOverrides,
    TextStyle? textTabbarLabelOverrides,
  }) {
    textTabbarLabel = TextStyle(
      inherit: textTabbarLabelOverrides?.inherit ?? allOverrides?.inherit ?? true,
      color: textTabbarLabelOverrides?.color ?? allOverrides?.color,
      backgroundColor: textTabbarLabelOverrides?.backgroundColor ?? allOverrides?.backgroundColor,
      fontFamily: textTabbarLabelOverrides?.fontFamily ?? allOverrides?.fontFamily ?? "SF Pro Text",
      fontSize: textTabbarLabelOverrides?.fontSize ?? allOverrides?.fontSize ?? 10.0,
      fontWeight: textTabbarLabelOverrides?.fontWeight ?? allOverrides?.fontWeight ?? FontWeight.w500,
      fontStyle: textTabbarLabelOverrides?.fontStyle ?? allOverrides?.fontStyle,
      letterSpacing: textTabbarLabelOverrides?.letterSpacing ?? allOverrides?.letterSpacing,
      wordSpacing: textTabbarLabelOverrides?.wordSpacing ?? allOverrides?.wordSpacing,
      textBaseline: textTabbarLabelOverrides?.textBaseline ?? allOverrides?.textBaseline,
      height: textTabbarLabelOverrides?.height ?? allOverrides?.height,
      decoration: textTabbarLabelOverrides?.decoration ?? allOverrides?.decoration,
      decorationColor: textTabbarLabelOverrides?.decorationColor ?? allOverrides?.decorationColor,
      decorationStyle: textTabbarLabelOverrides?.decorationStyle ?? allOverrides?.decorationStyle,
      decorationThickness: textTabbarLabelOverrides?.decorationThickness ?? allOverrides?.decorationThickness,
      debugLabel: textTabbarLabelOverrides?.debugLabel ?? allOverrides?.debugLabel,
      shadows: textTabbarLabelOverrides?.shadows ?? allOverrides?.shadows,
      fontFeatures: textTabbarLabelOverrides?.fontFeatures ?? allOverrides?.fontFeatures,
      fontVariations: textTabbarLabelOverrides?.fontVariations ?? allOverrides?.fontVariations,
      overflow: textTabbarLabelOverrides?.overflow ?? allOverrides?.overflow,
    );
  }
}
