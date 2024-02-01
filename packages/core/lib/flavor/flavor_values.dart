/// Class containing values specific to each flavor of the application.
class FlavorValues {
  /// Create an FlavorValues object with the given values.
  ///   - `appName`: The name of the application.
  ///   - `baseUrl`: The base URL of the application's API.
  const FlavorValues({
    required this.appName,
    this.baseUrl,
  });

  final String appName;
  final String? baseUrl;
}
