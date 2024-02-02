import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesAfter: [
    ExternalModule(HomePackageModule),
  ],
)
Future<void> configureDependencies(String env) async =>
    getIt.init(environment: env);
