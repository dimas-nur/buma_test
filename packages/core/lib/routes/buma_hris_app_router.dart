import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:injectable/injectable.dart';

import 'buma_hris_app_router.gr.dart';

@singleton
@AutoRouterConfig(
  modules: [
    HomeRouteModule,
  ],
)
class BumaHrisAppRouter extends $BumaHrisAppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeWrapperRoute.page,
          path: '/',
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            _routeBuilder(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
            ),
            _routeBuilder(
              path: 'chat',
              page: ChatRoute.page,
            ),
            _routeBuilder(
              path: 'feed',
              page: FeedRoute.page,
            ),
            _routeBuilder(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}

AutoRoute _routeBuilder({
  required PageInfo page,
  String? path,
  bool initial = false,
}) {
  return AutoRoute(
    page: page,
    path: path,
    initial: initial,
  );
}
