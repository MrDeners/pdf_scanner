import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_text_button/app_text_button_style_enum.dart';
import 'package:flutter/material.dart';

class AppTextButtonMapper {
  static Color getContentColor({
    required AppColorsTheme colors,
    required AppTextButtonStyle style,
  }) {
    return switch (style) {
      AppTextButtonStyle.primary => colors.accent,
      AppTextButtonStyle.secondary => colors.onSecondaryLight,
    };
  }
}
