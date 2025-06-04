import 'package:core_ui/core_ui.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductTile({
    required this.title,
    required this.description,
    required this.price,
    required this.isSelected,
    required this.onTap,
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
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          border: Border.all(
            color: isSelected ? colors.accent : Colors.transparent,
            width: AppDimens.defaultBorderWidth,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPagePadding * 0.6),
          child: Row(
            spacing: AppDimens.spacerMedium,
            children: <Widget>[
              if (description.isNotEmpty)
                Expanded(
                  child: Column(
                    spacing: AppDimens.spacerSmallest,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: AppFonts.h4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description,
                        style: AppFonts.h6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              else
                Text(
                  title,
                  style: AppFonts.h4,
                  overflow: TextOverflow.ellipsis,
                ),
              Text(
                price,
                style: AppFonts.h4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
