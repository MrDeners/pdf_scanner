import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppOnboardingScreenTemplate extends StatelessWidget {
  final int activeIndex;
  final int screensAmount;
  final String title;
  final String description;
  final Widget content;
  final VoidCallback onContinue;

  const AppOnboardingScreenTemplate({
    required this.activeIndex,
    required this.screensAmount,
    required this.title,
    required this.description,
    required this.content,
    required this.onContinue,
    super.key,
  });

  static const double _betweenSpacer = AppDimens.spacerLargest;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: AppImages.pattern.call(),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPagePadding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.75),
                    child: Row(
                      spacing: AppDimens.spacerLargest,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: AppOnboardingProgressBar(
                            amount: screensAmount,
                            activeIndex: activeIndex,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            spacing: AppDimens.spacerSmall,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: AppFonts.h1,
                              ),
                              Text(
                                description,
                                style: AppFonts.h3.copyWith(color: colors.onSecondaryLight),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(child: content),
              const SizedBox(height: _betweenSpacer),
              AppElevatedButton.custom(
                onTap: onContinue,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        LocaleKeys.common_continue.watchTr(context),
                        style: AppFonts.h4.copyWith(color: colors.onAccent),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppIcons.rightArrowLong.call(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
