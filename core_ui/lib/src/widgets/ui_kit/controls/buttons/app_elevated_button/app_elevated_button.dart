import 'package:core_ui/src/extensions.dart';
import 'package:core_ui/src/theme/app_dimens.dart';
import 'package:core_ui/src/theme/app_fonts.dart';
import 'package:core_ui/src/theme/colors/app_colors_theme.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_elevated_button/app_elevated_button_mapper.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_elevated_button/app_elevated_button_style_enum.dart';
import 'package:flutter/material.dart';

export 'app_elevated_button_style_enum.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final AppElevatedButtonStyle style;
  final bool isEnabled;
  final bool isLoading;
  final Widget? postfix;
  final VoidCallback onTap;
  final Widget? content;

  const AppElevatedButton({
    required this.title,
    required this.onTap,
    this.style = AppElevatedButtonStyle.primary,
    this.isEnabled = true,
    this.isLoading = false,
    this.postfix,
    super.key,
  }) : content = null;

  const AppElevatedButton.custom({
    required this.content,
    required this.onTap,
    this.style = AppElevatedButtonStyle.primary,
    this.isEnabled = true,
    this.isLoading = false,
    this.postfix,
    super.key,
  }) : title = '';

  @override
  Widget build(BuildContext context) {
    const double indicatorSize = AppDimens.defaultButtonHeight / 3;

    final AppColorsTheme colors = context.colors;

    final Color foregroundColor = AppElevatedButtonMapper.getContentColor(
      colors: colors,
      style: style,
    );

    final Color backgroundColor = AppElevatedButtonMapper.getBackgroundColor(
      colors: colors,
      style: style,
    );

    final Color shadowColor = AppElevatedButtonMapper.getShadowColor(
      colors: colors,
      style: style,
    );

    return AbsorbPointer(
      absorbing: isLoading,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: colors.onSecondaryLight,
          shadowColor: shadowColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
          ),
        ),
        onPressed: isEnabled ? _onPressed : null,
        child: SizedBox(
          height: AppDimens.defaultButtonHeight,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: indicatorSize,
                    width: indicatorSize,
                    child: CircularProgressIndicator(
                      color: foregroundColor,
                      strokeWidth: 2,
                    ),
                  )
                : content ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.h4,
                          ),
                        ),
                        if (postfix != null) ...<Widget>[
                          const SizedBox(width: AppDimens.spacerExtraSmall),
                          postfix!,
                        ],
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (!isLoading) {
      onTap();
    }
  }
}
