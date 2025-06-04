import 'package:core_ui/src/theme/colors/app_colors.dart';
import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  factory AppTheme.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightTheme() : const DarkTheme();
  }

  ThemeData get theme;

  AppColorsTheme get colors;
}

class LightTheme implements AppTheme {
  const LightTheme();

  @override
  ThemeData get theme {
    return ThemeData(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      brightness: Brightness.light,
      primaryColor: AppColors.whiteDark,
      scaffoldBackgroundColor: AppColors.whiteDark,
      cardColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteDark,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 19,
          fontWeight: FontWeight.w500,
          fontFamily: 'SF Pro',
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.red,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.whiteDark,
        secondary: AppColors.whiteDark,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        surface: AppColors.black,
        error: AppColors.red,
      ),
    );
  }

  @override
  AppColorsTheme get colors => const LightColorTheme();
}

class DarkTheme extends LightTheme {
  const DarkTheme();
}
