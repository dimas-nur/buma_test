import 'package:auto_route/auto_route.dart';
import 'package:employee_services/employee_services.dart';
import 'package:home/home.dart';
import 'package:injectable/injectable.dart';
import 'package:leave/leave.dart';

import 'buma_hris_app_router.gr.dart';

export 'package:home/home.gm.dart';
export 'package:employee_services/employee_services.gm.dart';
export 'package:leave/leave.gm.dart';

@singleton
@AutoRouterConfig(
  modules: [
    HomeRouteModule,
    EmployeeServicesRouteModule,
    LeaveRouteModule,
  ],
)
class BumaHrisAppRouter extends $BumaHrisAppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );

  @override
  List<AutoRoute> get routes => [
        _homeRouter,
        ..._employeeServiceRoutes,
        ..._leaveRoutes,
        RedirectRoute(path: '*', redirectTo: '/'),
      ];

  static final _homeRouter = AutoRoute(
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
  );

  static final _employeeServiceRoutes = [
    _routeBuilder(
      path: '/employee-services',
      page: EmployeeServicesRoute.page,
    )
  ];

  static final _leaveRoutes = [
    _routeBuilder(
      path: '/leave',
      page: LeaveRoute.page,
    ),
    _routeBuilder(
      path: '/leave-request',
      page: LeaveRequestRoute.page,
    ),
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
