import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'app/runner.dart' as app_runner;

void main() async {
  FlavorConfig(
    flavor: Flavor.production,
    values: const FlavorValues(
      appName: 'BUMA HRIS',
    ),
    color: Colors.green,
  );

  await app_runner.run(FlavorConfig.env);
}
