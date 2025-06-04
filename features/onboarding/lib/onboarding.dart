library onboarding;

import 'package:navigation/navigation.dart';

export 'onboarding.gr.dart';

@AutoRouterConfig()
class OnboardingRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: OnboardingRoute.page),
      ];
}
