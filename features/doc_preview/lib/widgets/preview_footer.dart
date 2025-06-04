import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class PreviewFooter extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onEdit;

  const PreviewFooter({
    required this.onAdd,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.defaultPagePadding),
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimens.borderRadiusMedium),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.defaultPagePadding,
          horizontal: AppDimens.defaultPagePadding * 2,
        ),
        child: Row(
          children: <Widget>[
            AppIconButton(
              icon: AppIcons.edit,
              title: LocaleKeys.preview_action_edit_title.watchTr(context),
              style: AppIconButtonStyle.secondary,
              onTap: onEdit,
            ),
            const Spacer(),
            AppIconButton(
              icon: AppIcons.addDocument,
              title: LocaleKeys.preview_action_add_title.watchTr(context),
              style: AppIconButtonStyle.secondary,
              onTap: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
