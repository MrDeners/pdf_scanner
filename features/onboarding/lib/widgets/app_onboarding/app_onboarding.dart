import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:onboarding/widgets/app_onboarding/screens/app_onboarding_first.dart';
import 'package:onboarding/widgets/app_onboarding/screens/app_onboarding_second.dart';

class AppOnboarding extends StatefulWidget {
  final VoidCallback onSuccess;

  const AppOnboarding({
    required this.onSuccess,
    super.key,
  });

  @override
  State<AppOnboarding> createState() => _AppOnboardingState();
}

class _AppOnboardingState extends State<AppOnboarding> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        AppOnboardingFirst(
          onContinue: () async {
            _navigateNext();
            await RateService.requestRate();
          },
        ),
        AppOnboardingSecond(onContinue: widget.onSuccess),
      ],
    );
  }

  void _navigateNext() {
    _controller.nextPage(
      duration: AppDimens.animationDurationShort,
      curve: Curves.linear,
    );
  }
}
