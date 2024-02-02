import 'package:core/di/locator.dart';
import 'package:flutter/material.dart';

import 'buma_hris_app.dart';

/// Runs the application with the given environment.
Future<void> run(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env);

  runApp(const BumaHrisApp());
}
