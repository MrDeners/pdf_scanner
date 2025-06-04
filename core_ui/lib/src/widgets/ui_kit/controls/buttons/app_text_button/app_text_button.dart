import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/ui_kit/controls/buttons/app_text_button/app_text_button_mapper.dart';

export 'app_text_button_style_enum.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final AppTextButtonStyle style;
  final Widget? tailing;
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback onTap;

  const AppTextButton({
    required this.title,
    required this.onTap,
    this.style = AppTextButtonStyle.primary,
    this.isEnabled = true,
    this.isExpanded = false,
    this.tailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color contentColor = AppTextButtonMapper.getContentColor(
      colors: colors,
      style: style,
    );

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: isExpanded ? AppDimens.defaultControlHeight : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: AppFonts.h5.copyWith(color: contentColor),
            ),
            if (tailing != null) ...<Widget>[
              const SizedBox(width: AppDimens.spacerSmallest),
              tailing ?? const SizedBox.shrink(),
            ]
          ],
        ),
      ),
    );
  }
}
