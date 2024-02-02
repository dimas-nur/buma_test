// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:employee_services/employee_services.dart' as _i3;
import 'package:home/home.dart' as _i2;

abstract class $BumaHrisAppRouter extends _i1.RootStackRouter {
  $BumaHrisAppRouter({super.navigatorKey});

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ..._i2.HomeRouteModule().pagesMap,
    ..._i3.EmployeeServicesRouteModule().pagesMap,
  };
}
