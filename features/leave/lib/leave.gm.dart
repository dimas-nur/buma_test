// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:leave/presentation/leave/leave_page.dart' as _i1;
import 'package:leave/presentation/request/leave_request_page.dart' as _i2;

abstract class $LeaveRouteModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LeaveRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LeavePage(),
      );
    },
    LeaveRequestRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeaveRequestPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LeavePage]
class LeaveRoute extends _i3.PageRouteInfo<void> {
  const LeaveRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LeaveRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeaveRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LeaveRequestPage]
class LeaveRequestRoute extends _i3.PageRouteInfo<void> {
  const LeaveRequestRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LeaveRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeaveRequestRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
