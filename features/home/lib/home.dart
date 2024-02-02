library home;

import 'package:auto_route/annotations.dart';

import 'home.gm.dart';

export 'presentation/presentation.dart';
export 'home.gm.dart';

@AutoRouterConfig.module()
class HomeRouteModule extends $HomeRouteModule {}
