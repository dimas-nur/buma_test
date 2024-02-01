import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'app/runner.dart' as app_runner;

void main() async {
  FlavorConfig(
    flavor: Flavor.staging,
    values: const FlavorValues(
      appName: 'BUMA HRIS [STG]',
    ),
    color: Colors.blue,
  );

  await app_runner.run(FlavorConfig.env);
}
