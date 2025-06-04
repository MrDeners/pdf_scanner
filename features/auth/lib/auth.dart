library auth;

import 'package:navigation/navigation.dart';

export 'auth.gr.dart';

@AutoRouterConfig()
class AuthRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
      ];
}
