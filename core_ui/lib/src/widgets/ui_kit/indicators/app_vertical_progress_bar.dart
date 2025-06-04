import 'package:core_ui/core_ui.dart';

class AppOnboardingProgressBar extends StatelessWidget {
  final int activeIndex;
  final int amount;

  const AppOnboardingProgressBar({
    required this.activeIndex,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final List<Widget> items = List<Widget>.generate(
      amount,
      (int index) => switch (index == (activeIndex - 1)) {
        true => Container(
            width: 5.0,
            height: 44.0,
            decoration: BoxDecoration(
              color: colors.accent,
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
            ),
          ),
        false => Container(
            width: 5.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: colors.onSecondaryLightest,
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
            ),
          ),
      },
    );

    return Column(
      spacing: AppDimens.spacerExtraSmall,
      children: items,
    );
  }
}
