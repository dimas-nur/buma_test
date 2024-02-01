import 'dart:ui';

import 'flavor_values.dart';

/// Enum representing different flavors of the application, such as production, staging, and development.
enum Flavor {
  production('prod'),
  staging('stg'),
  development('dev');

  const Flavor(this.env);

  final String env;
}

/// Configuration class that holds information about the current flavor of the application.
class FlavorConfig {
  const FlavorConfig._internal(
    this.flavor,
    this.name,
    this.color,
    this.values,
  );

  /// Create an FlavorConfig object with the given values.
  factory FlavorConfig({
    required Flavor flavor,
    required Color color,
    required FlavorValues values,
  }) {
    _instance = FlavorConfig._internal(
      flavor,
      flavor.name,
      color,
      values,
    );
    return _instance;
  }

  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;

  static late final FlavorConfig _instance;

  /// Gets the current instance of the FlavorConfig.
  static FlavorConfig get instance {
    return _instance;
  }

  /// Checks if the current flavor is production.
  static bool get isProduction => _instance.flavor == Flavor.production;

  /// Checks if the current flavor is staging.
  static bool get isStaging => _instance.flavor == Flavor.staging;

  /// Checks if the current flavor is development.
  static bool get isDevelopment => _instance.flavor == Flavor.development;

  /// Gets the environment name of the current flavor.
  static String get env => _instance.flavor.env;
}
