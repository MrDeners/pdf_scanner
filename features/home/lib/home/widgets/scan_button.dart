import 'package:core_ui/core_ui.dart';

class ScanButton extends StatelessWidget {
  final VoidCallback onTap;

  const ScanButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: constraint.maxWidth * 0.66,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: colors.shadow.withAlpha(10),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colors.accent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.border,
                    width: AppDimens.defaultBorderWidth * 2,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: colors.shadow.withAlpha(40),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: AppIcons.scan.call(size: AppDimens.iconSizeLarge),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
