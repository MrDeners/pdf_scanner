import 'package:core_ui/src/extensions.dart';
import 'package:core_ui/src/theme/app_dimens.dart';
import 'package:core_ui/src/theme/app_fonts.dart';
import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/app_icon.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_icon_button/app_icon_button.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_icon_button/app_icon_button_mapper.dart';
import 'package:flutter/material.dart';

export 'app_icon_button_style_enum.dart';

class AppIconButton extends StatelessWidget {
  final AppIcon icon;
  final String title;
  final AppIconButtonStyle style;
  final Color? contentColor;
  final bool isEnabled;
  final bool isLoading;
  final bool withBackground;
  final VoidCallback onTap;
  final double? size;

  const AppIconButton({
    required this.icon,
    required this.onTap,
    this.style = AppIconButtonStyle.primary,
    this.title = '',
    this.isEnabled = true,
    this.isLoading = false,
    this.withBackground = false,
    this.contentColor,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double indicatorSize = size != null ? (size! / 3) : AppDimens.defaultButtonHeight / 3;

    final AppColorsTheme colors = context.colors;

    final Color contentColor = AppIconButtonMapper.getContentColor(
      colors: colors,
      style: style,
    );

    final Color backgroundColor = AppIconButtonMapper.getBackgroundColor(
      colors: colors,
      style: style,
    );

    return AbsorbPointer(
      absorbing: isLoading,
      child: Column(
        children: <Widget>[
          Container(
            height: size ?? AppDimens.defaultButtonHeight / 1.5,
            width: size ?? AppDimens.defaultButtonHeight / 1.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: withBackground ? backgroundColor : null,
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                height: indicatorSize,
                width: indicatorSize,
                child: CircularProgressIndicator(
                  color: contentColor,
                  strokeWidth: 2,
                ),
              )
                  : icon.call(
                    color: this.contentColor ?? contentColor,
                    onTap: _onPressed,
                    size: size ?? AppDimens.iconSizeMedium,
                  ),
            ),
          ),
          if (title.isNotEmpty)
            Text(
              title,
              style: AppFonts.h5.copyWith(color: contentColor),
            ),
        ],
      ),
    );
  }

  void _onPressed() {
    if (!isLoading) {
      onTap();
    }
  }
}
