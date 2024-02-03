import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'app/runner.dart' as app_runner;

void main() async {
  FlavorConfig(
    flavor: Flavor.development,
    values: const FlavorValues(
      appName: 'BUMA HRIS [DEV]',
    ),
    color: Colors.orange,
  );

  await app_runner.run(FlavorConfig.env);
}
