import 'package:flutter/material.dart';

import 'example_colors_theme_light_mode_core_border.dart';
import 'example_colors_theme_light_mode_core_surface.dart';
import 'example_colors_theme_light_mode_badge.dart';
import 'example_colors_theme_light_mode_banner.dart';
import 'example_colors_theme_light_mode_button.dart';
import 'example_colors_theme_light_mode_chat_bubble.dart';
import 'example_colors_theme_light_mode_choice_selection.dart';
import 'example_colors_theme_light_mode_copy.dart';
import 'example_colors_theme_light_mode_input_field.dart';
import 'example_colors_theme_light_mode_profile_preview.dart';
import 'example_colors_theme_light_mode_progress_bar.dart';
import 'example_colors_theme_light_mode_tabbar.dart';

class ExampleTheme {
  /// Set to override the returned theme
  static ThemeType? userPrefferedThemeType;

  /// Set to add logic in the creation of your themes.
  /// This can be used to override default colors for
  /// all or specific textStyles
  static dynamic Function(ExampleColorsThemeLightModeCoreBorder colors)? textThemeBuilder;

  static final _themeTypeMap = <ThemeType, ExampleTheme>{
    ThemeType.exampleColorsThemeLightModeCoreBorderType: _exampleColorsThemeLightModeCoreBorder,
    ThemeType.exampleColorsThemeLightModeCoreSurfaceType: _exampleColorsThemeLightModeCoreSurface,
    ThemeType.exampleColorsThemeLightModeBadgeType: _exampleColorsThemeLightModeBadge,
    ThemeType.exampleColorsThemeLightModeBannerType: _exampleColorsThemeLightModeBanner,
    ThemeType.exampleColorsThemeLightModeButtonType: _exampleColorsThemeLightModeButton,
    ThemeType.exampleColorsThemeLightModeChatBubbleType: _exampleColorsThemeLightModeChatBubble,
    ThemeType.exampleColorsThemeLightModeChoiceSelectionType: _exampleColorsThemeLightModeChoiceSelection,
    ThemeType.exampleColorsThemeLightModeCopyType: _exampleColorsThemeLightModeCopy,
    ThemeType.exampleColorsThemeLightModeInputFieldType: _exampleColorsThemeLightModeInputField,
    ThemeType.exampleColorsThemeLightModeProfilePreviewType: _exampleColorsThemeLightModeProfilePreview,
    ThemeType.exampleColorsThemeLightModeProgressBarType: _exampleColorsThemeLightModeProgressBar,
    ThemeType.exampleColorsThemeLightModeTabbarType: _exampleColorsThemeLightModeTabbar,
  };

  static final _exampleColorsThemeLightModeCoreBorder = _createExampleTheme(ExampleColorsThemeLightModeCoreBorder());
  static final _exampleColorsThemeLightModeCoreSurface = _createExampleTheme(ExampleColorsThemeLightModeCoreSurface.instance);
  static final _exampleColorsThemeLightModeBadge = _createExampleTheme(ExampleColorsThemeLightModeBadge.instance);
  static final _exampleColorsThemeLightModeBanner = _createExampleTheme(ExampleColorsThemeLightModeBanner.instance);
  static final _exampleColorsThemeLightModeButton = _createExampleTheme(ExampleColorsThemeLightModeButton.instance);
  static final _exampleColorsThemeLightModeChatBubble = _createExampleTheme(ExampleColorsThemeLightModeChatBubble.instance);
  static final _exampleColorsThemeLightModeChoiceSelection = _createExampleTheme(ExampleColorsThemeLightModeChoiceSelection.instance);
  static final _exampleColorsThemeLightModeCopy = _createExampleTheme(ExampleColorsThemeLightModeCopy.instance);
  static final _exampleColorsThemeLightModeInputField = _createExampleTheme(ExampleColorsThemeLightModeInputField.instance);
  static final _exampleColorsThemeLightModeProfilePreview = _createExampleTheme(ExampleColorsThemeLightModeProfilePreview.instance);
  static final _exampleColorsThemeLightModeProgressBar = _createExampleTheme(ExampleColorsThemeLightModeProgressBar.instance);
  static final _exampleColorsThemeLightModeTabbar = _createExampleTheme(ExampleColorsThemeLightModeTabbar.instance);

  final ExampleColorsThemeLightModeCoreBorder colors;

  ExampleTheme(this.colors);

  static ExampleTheme _createExampleTheme(ExampleColorsThemeLightModeCoreBorder colors) {
    return ExampleTheme(colors);
  }

  static ExampleTheme of(
    BuildContext context, {
    bool forceLightModeCoreBorder = false,
    bool forceLightModeCoreSurface = false,
    bool forceLightModeBadge = false,
    bool forceLightModeBanner = false,
    bool forceLightModeButton = false,
    bool forceLightModeChatBubble = false,
    bool forceLightModeChoiceSelection = false,
    bool forceLightModeCopy = false,
    bool forceLightModeInputField = false,
    bool forceLightModeProfilePreview = false,
    bool forceLightModeProgressBar = false,
    bool forceLightModeTabbar = false,
  }) {
    if (forceLightModeCoreBorder) return _exampleColorsThemeLightModeCoreBorder;
    if (forceLightModeCoreSurface) return _exampleColorsThemeLightModeCoreSurface;
    if (forceLightModeBadge) return _exampleColorsThemeLightModeBadge;
    if (forceLightModeBanner) return _exampleColorsThemeLightModeBanner;
    if (forceLightModeButton) return _exampleColorsThemeLightModeButton;
    if (forceLightModeChatBubble) return _exampleColorsThemeLightModeChatBubble;
    if (forceLightModeChoiceSelection) return _exampleColorsThemeLightModeChoiceSelection;
    if (forceLightModeCopy) return _exampleColorsThemeLightModeCopy;
    if (forceLightModeInputField) return _exampleColorsThemeLightModeInputField;
    if (forceLightModeProfilePreview) return _exampleColorsThemeLightModeProfilePreview;
    if (forceLightModeProgressBar) return _exampleColorsThemeLightModeProgressBar;
    if (forceLightModeTabbar) return _exampleColorsThemeLightModeTabbar;
    if (userPrefferedThemeType != null) return _themeTypeMap[userPrefferedThemeType!]!;

    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) return _exampleColorsThemeLightModeCoreBorder;
    return _exampleColorsThemeLightModeCoreSurface;
  }
}

enum ThemeType {
  exampleColorsThemeLightModeCoreBorderType,
  exampleColorsThemeLightModeCoreSurfaceType,
  exampleColorsThemeLightModeBadgeType,
  exampleColorsThemeLightModeBannerType,
  exampleColorsThemeLightModeButtonType,
  exampleColorsThemeLightModeChatBubbleType,
  exampleColorsThemeLightModeChoiceSelectionType,
  exampleColorsThemeLightModeCopyType,
  exampleColorsThemeLightModeInputFieldType,
  exampleColorsThemeLightModeProfilePreviewType,
  exampleColorsThemeLightModeProgressBarType,
  exampleColorsThemeLightModeTabbarType,
}
