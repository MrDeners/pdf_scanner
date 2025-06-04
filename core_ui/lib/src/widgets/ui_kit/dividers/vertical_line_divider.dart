import 'package:core_ui/core_ui.dart';

class VerticalLineDivider extends StatelessWidget {
  final double height;

  const VerticalLineDivider({
    this.height = 14,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      width: 1,
      height: height,
      color: colors.onSecondaryLightest,
    );
  }
}
