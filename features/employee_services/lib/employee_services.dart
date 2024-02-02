library employee_services;

import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

import 'employee_services.gm.dart';

export 'presentation/presentation.dart';
export 'employee_services.gm.dart';
export 'employee_services.module.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class EmployeeServicesModule {}

@AutoRouterConfig.module()
class EmployeeServicesRouteModule extends $EmployeeServicesRouteModule {}
