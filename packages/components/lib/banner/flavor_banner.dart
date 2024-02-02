import 'package:flutter/material.dart';

/// A widget that displays a banner at the top-left corner of the screen
/// for non-production environments, providing visual feedback about the application flavor.
class FlavorBanner extends StatelessWidget {
  /// Constructs a FlavorBanner widget.
  ///
  /// Parameters:
  ///   - `color`: The color of the banner.
  ///   - `message`: The message to be displayed on the banner.
  ///   - `isProduction`: A flag indicating whether the application is in production.
  ///   - `child`: The child widget to be displayed behind the banner.
  const FlavorBanner({
    super.key,
    required this.color,
    required this.message,
    required this.isProduction,
    this.child,
  });

  final Color color;
  final String message;
  final bool isProduction;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // If the application is in production, return the child widget without the banner.
    if (isProduction) return child!;

    // If not in production, display a banner with the specified color and message.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: color,
        message: message,
        location: BannerLocation.topStart,
        textStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 8.0 * 0.80,
          fontWeight: FontWeight.w900,
          height: 1.0,
          overflow: TextOverflow.ellipsis,
        ),
        child: child,
      ),
    );
  }
}
