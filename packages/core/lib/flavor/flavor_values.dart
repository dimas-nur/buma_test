/// Class containing values specific to each flavor of the application.
class FlavorValues {
  /// Create an FlavorValues object with the given values.
  const FlavorValues({
    required this.appName,
    this.baseUrl,
  });

  final String appName;
  final String? baseUrl;
}
