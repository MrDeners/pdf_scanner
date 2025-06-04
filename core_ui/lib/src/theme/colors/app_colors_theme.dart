import 'package:core_ui/src/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme();

  Color get primary;

  Color get secondary;

  Color get onSecondary;

  Color get onSecondaryLight;

  Color get onSecondaryLightest;

  Color get accent;

  Color get onAccent;

  Color get border;

  Color get borderAccent;

  Color get shadow;

  Color get shadowAccent;

  Color get divider;

  Color get error;

  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(covariant ThemeExtension<AppColorsTheme>? other, double t) {
    return this;
  }
}

class LightColorTheme extends AppColorsTheme {
  const LightColorTheme();

  @override
  Color get primary => AppColors.whiteDark;

  @override
  Color get secondary => AppColors.white;

  @override
  Color get onSecondary => AppColors.black;

  @override
  Color get onSecondaryLight => AppColors.brown;

  @override
  Color get onSecondaryLightest => AppColors.grey;

  @override
  Color get accent => AppColors.red;

  @override
  Color get onAccent => AppColors.white;

  @override
  Color get border => AppColors.white;

  @override
  Color get borderAccent => AppColors.red;

  @override
  Color get shadow => AppColors.black;

  @override
  Color get shadowAccent => AppColors.redDark;

  @override
  Color get divider => AppColors.grey;

  @override
  Color get error => AppColors.redDark;
}
