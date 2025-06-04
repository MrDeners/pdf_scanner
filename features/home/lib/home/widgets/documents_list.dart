import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:home/home/widgets/document_tile.dart';

class DocumentsList extends StatelessWidget {
  final List<DocumentData> documents;
  final VoidCallback onSort;
  final bool isSortedHeight;
  final ValueChanged<int> onTap;
  final ValueChanged<int> onTapMenu;

  const DocumentsList({
    required this.documents,
    required this.onSort,
    required this.isSortedHeight,
    required this.onTap,
    required this.onTapMenu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final List<DocumentTile> tiles = List<DocumentTile>.generate(
      documents.length,
      (int index) => DocumentTile(
        key: UniqueKey(),
        document: documents[index],
        onTap: () => onTap(index),
        onTapMenu: () => onTapMenu(index),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultPagePadding),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  LocaleKeys.home_tiles_documents_title.watchTr(context),
                  style: AppFonts.h2,
                ),
                if (tiles.isNotEmpty) ...<Widget>[
                  const Spacer(),
                  AppIconButton(
                    icon: isSortedHeight ? AppIcons.swapHeight : AppIcons.swapLow,
                    withBackground: true,
                    onTap: onSort,
                  ),
                ]
              ],
            ),
            const SizedBox(height: AppDimens.spacerMedium),
            if (tiles.isEmpty) ...<Widget>[
              Center(child: AppImages.document.call(needShadow: true, size: MediaQuery.sizeOf(context).width * 0.35)),
              const SizedBox(height: AppDimens.spacerExtraLarge),
              Text(
                LocaleKeys.home_tiles_documents_emptyTitle.watchTr(context),
                style: AppFonts.h3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimens.spacerExtraSmall),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.6),
                child: Text(
                  LocaleKeys.home_tiles_documents_emptyDescription.watchTr(context),
                  style: AppFonts.h5.copyWith(color: colors.onSecondaryLight),
                  textAlign: TextAlign.center,
                ),
              ),
            ] else
              Flexible(
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(height: AppDimens.spacerSmall),
                  itemCount: tiles.length,
                  itemBuilder: (_, int index) => tiles[index],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
