import 'example_colors.dart';
import 'example_colors_theme_default.dart';

class ExampleColorsThemeLightModeChatBubble {
  ExampleColorsThemeLightModeChatBubble._();

  static final instance = ExampleColorsThemeDefault(
    chatBubbleSurfaceCoach: ExampleColors.surfaceOnCanvasDefault01,
    chatBubbleSurfaceMe: ExampleColors.brandColoursBrandC148,
    chatBubbleTextMe: ExampleColors.brandColoursNeutrals100,
    chatBubbleTextCoach: ExampleColors.copyTextDefault,
  );
}
