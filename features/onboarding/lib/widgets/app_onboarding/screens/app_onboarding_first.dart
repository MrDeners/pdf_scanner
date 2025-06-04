import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:onboarding/widgets/app_onboarding/screens/app_onboarding_screen_template.dart';

class AppOnboardingFirst extends StatelessWidget {
  final VoidCallback onContinue;

  const AppOnboardingFirst({
    required this.onContinue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppOnboardingScreenTemplate(
      activeIndex: 1,
      screensAmount: 3,
      title: LocaleKeys.onboarding_firstPage_title.watchTr(context),
      description: LocaleKeys.onboarding_firstPage_description.watchTr(context),
      content: AppImages.onboardingFirst.call(),
      onContinue: onContinue,
    );
  }
}
