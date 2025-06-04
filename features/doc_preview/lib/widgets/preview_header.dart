import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class PreviewHeader extends StatelessWidget {
  final String title;
  final int pageAmount;
  final int selectedPage;
  final VoidCallback onShare;
  final VoidCallback onNavigateBack;

  const PreviewHeader({
    required this.title,
    required this.pageAmount,
    required this.selectedPage,
    required this.onShare,
    required this.onNavigateBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.defaultPagePadding),
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colors.shadow.withAlpha(30),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          AppIcons.arrowLeft.call(onTap: onNavigateBack),
          const SizedBox(width: AppDimens.spacerExtraSmall),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.3),
            child: Text(
              title,
              style: AppFonts.h2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppDimens.spacerSmallest),
          const VerticalLineDivider(),
          const SizedBox(width: AppDimens.spacerSmallest),
          Text(
            LocaleKeys.preview_pagesAmount.watchTr(
              context,
              namedArgs: <String, String>{
                'selectedPageIndex': (selectedPage + 1).toString(),
                'pagesAmount': pageAmount.toString(),
              },
            ),
            style: AppFonts.h4.copyWith(color: colors.onSecondaryLight),
          ),
          const SizedBox(width: AppDimens.spacerSmallest),
          const Spacer(),
          AppTextButton(
            title: LocaleKeys.preview_action_share_title.watchTr(context),
            tailing: AppIcons.share.call(color: colors.accent),
            onTap: onShare,
          ),
        ],
      ),
    );
  }
}
