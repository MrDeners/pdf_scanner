import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_icon_button/app_icon_button.dart';
import 'package:flutter/material.dart';

class AppIconButtonMapper {
  static Color getContentColor({
    required AppColorsTheme colors,
    required AppIconButtonStyle style,
  }) {
    return switch (style) {
      AppIconButtonStyle.primary => colors.onAccent,
      AppIconButtonStyle.secondary => colors.onSecondary,
    };
  }

  static Color getBackgroundColor({
    required AppColorsTheme colors,
    required AppIconButtonStyle style,
  }) {
    return switch (style) {
      AppIconButtonStyle.primary => colors.accent,
      AppIconButtonStyle.secondary => colors.accent,
    };
  }
}
