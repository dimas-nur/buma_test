import 'package:flutter/material.dart';

/// The `CustomInkWell` widget is a customizable InkWell that provides a visual ripple effect
/// in response to touch or click interactions. It wraps a child widget and allows you to specify
/// additional parameters such as `onTap`, `borderRadius`, and `splashColor`.
///
/// ## Usage
/// To use `CustomInkWell`, create an instance of the widget by specifying the `onTap` callback
/// (function to be called when the ink well is tapped), and customize its appearance using optional
/// parameters like `child`, `borderRadius`, and `splashColor`.
///
/// Example:
/// ```dart
/// // Create a custom ink well with a text widget as a child and specified onTap callback
/// CustomInkWell(
///   onTap: () {
///     print('InkWell tapped!');
///   },
///   child: Text('Click me'),
///   borderRadius: BorderRadius.circular(8),
///   splashColor: Colors.blue,
/// );
/// ```
///
/// ## Parameters
/// - `onTap`: The callback function to be invoked when the ink well is tapped.
/// - `child`: The widget to be wrapped by the ink well and respond to touch/click interactions.
/// - `borderRadius`: The border radius of the ink well, controlling the shape of the ripple effect.
/// - `splashColor`: The color of the splash effect that appears when the ink well is tapped.
///
/// Example:
/// ```dart
/// // Create a custom ink well with a circular splash effect
/// CustomInkWell(
///   onTap: () {
///     print('Circular ink splash!');
///   },
///   splashColor: Colors.green,
///   borderRadius: BorderRadius.circular(50),
/// );
/// ```
class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.onTap,
    this.child,
    this.borderRadius,
    this.splashColor,
  });

  final void Function()? onTap;
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        highlightColor: splashColor?.withOpacity(.1),
        splashColor: splashColor?.withOpacity(.1),
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
