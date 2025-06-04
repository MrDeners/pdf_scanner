import 'package:core_ui/src/theme/app_theme.dart';
import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';

extension AppThemeGetter on BuildContext {
  ThemeData get theme => AppTheme.of(this).theme;

  AppColorsTheme get colors => AppTheme.of(this).colors;
}
