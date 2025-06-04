import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

class DocumentTile extends StatelessWidget {
  final DocumentData document;
  final VoidCallback onTap;
  final VoidCallback onTapMenu;

  const DocumentTile({
    required this.document,
    required this.onTap,
    required this.onTapMenu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPagePadding * 0.75),
          child: Row(
            spacing: AppDimens.spacerMedium,
            children: <Widget>[
              DocumentPreview(
                file: document.file,
                height: 65,
              ),
              Expanded(
                child: Column(
                  spacing: AppDimens.spacerSmallest,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      document.name,
                      style: AppFonts.h4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      spacing: AppDimens.spacerSmallest,
                      children: <Widget>[
                        Text(
                          document.pagesAmount.toString(),
                          style: AppFonts.h6.copyWith(color: colors.onSecondaryLightest),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const VerticalLineDivider(),
                        Text(
                          DateTimeFormatter.format(document.createdAt),
                          style: AppFonts.h6.copyWith(color: colors.onSecondaryLightest),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              AppIcons.verticalDotes.call(onTap: onTapMenu),
            ],
          ),
        ),
      ),
    );
  }
}
