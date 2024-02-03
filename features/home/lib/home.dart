library home;

import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

import 'home.gm.dart';

export 'presentation/presentation.dart';
export 'home.gm.dart';
export 'home.module.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class HomeModule {}

@AutoRouterConfig.module()
class HomeRouteModule extends $HomeRouteModule {}
