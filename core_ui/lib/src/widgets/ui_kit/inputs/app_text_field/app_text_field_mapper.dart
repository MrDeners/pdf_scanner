import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/inputs/app_text_field/app_text_field_style_enum.dart';
import 'package:flutter/material.dart';

class AppTextFieldMapper {
  static Color getBackgroundColor({
    required AppColorsTheme colors,
    required AppTextFieldStyle style,
  }) {
    return switch (style) {
      AppTextFieldStyle.primary => colors.primary,
      AppTextFieldStyle.secondary => colors.secondary,
    };
  }

  static Color getBorderColor({
    required AppColorsTheme colors,
    required AppTextFieldStyle style,
  }) {
    return switch (style) {
      AppTextFieldStyle.primary => colors.borderAccent,
      AppTextFieldStyle.secondary => colors.border,
    };
  }
}
