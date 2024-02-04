library leave;

import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

import 'leave.gm.dart';

export 'presentation/presentation.dart';
export 'leave.gm.dart';
export 'leave.module.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class LeaveModule {}

@AutoRouterConfig.module()
class LeaveRouteModule extends $LeaveRouteModule {}
