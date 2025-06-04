library paywall;

import 'package:navigation/navigation.dart';

export 'paywall.gr.dart';

@AutoRouterConfig()
class PaywallRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: PaywallRoute.page),
      ];
}
