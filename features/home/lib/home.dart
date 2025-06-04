library home;

import 'package:navigation/navigation.dart';

export 'home.gr.dart';

@AutoRouterConfig()
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: HomeRoute.page),
        CustomRoute<dynamic>(
          page: RenamePopup.page,
          customRouteBuilder: RouteBuilder.bottomSheet,
        ),
      ];
}
