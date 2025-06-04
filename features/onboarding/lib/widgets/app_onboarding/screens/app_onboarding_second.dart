import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:onboarding/widgets/app_onboarding/screens/app_onboarding_screen_template.dart';

class AppOnboardingSecond extends StatelessWidget {
  final VoidCallback onContinue;

  const AppOnboardingSecond({
    required this.onContinue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppOnboardingScreenTemplate(
      activeIndex: 2,
      screensAmount: 3,
      title: LocaleKeys.onboarding_secondPage_title.watchTr(context),
      description: LocaleKeys.onboarding_secondPage_description.watchTr(context),
      content: AppImages.onboardingSecond.call(),
      onContinue: onContinue,
    );
  }
}
