import 'dart:ui';

import 'package:core/core.dart';
import 'package:core_ui/src/extensions.dart';
import 'package:core_ui/src/theme/app_dimens.dart';
import 'package:core_ui/src/theme/app_fonts.dart';
import 'package:core_ui/src/theme/app_images.dart';
import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Material(
      color: colors.primary.withAlpha(150),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(color: colors.secondary.withAlpha(130)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppImages.logo2x.call(size: 200),
                const SizedBox(height: AppDimens.spacerExtraLarge),
                Text(
                  LocaleKeys.loading_title.watchTr(context),
                  style: AppFonts.h3.copyWith(color: colors.onSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
