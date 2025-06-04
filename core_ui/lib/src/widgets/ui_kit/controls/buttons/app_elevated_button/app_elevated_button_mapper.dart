import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_elevated_button/app_elevated_button_style_enum.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonMapper {
  static Color getBackgroundColor({
    required AppColorsTheme colors,
    required AppElevatedButtonStyle style,
  }) {
    switch (style) {
      case AppElevatedButtonStyle.primary:
        return colors.accent;
    }
  }

  static Color getContentColor({
    required AppColorsTheme colors,
    required AppElevatedButtonStyle style,
  }) {
    switch (style) {
      case AppElevatedButtonStyle.primary:
        return colors.onAccent;
    }
  }

  static Color getShadowColor({
    required AppColorsTheme colors,
    required AppElevatedButtonStyle style,
  }) {
    switch (style) {
      case AppElevatedButtonStyle.primary:
        return colors.shadowAccent;
    }
  }
}
