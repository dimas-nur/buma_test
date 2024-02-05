import 'dart:math' as math;

import 'package:flutter/material.dart';

/// SliverAppBarDelegate is a custom SliverPersistentHeaderDelegate implementation
/// for creating a flexible app bar with variable height in a Flutter application.
///
/// This delegate allows you to define a minimum and maximum height for the app bar
/// and provides a child widget that will be displayed within the app bar space.
///
/// Example Usage:
/// ```dart
/// SliverAppBarDelegate(
///   minHeight: 80.0,
///   maxHeight: 200.0,
///   child: YourCustomAppBarContent(),
/// );
/// ```
///
/// The `minHeight` property represents the minimum height of the app bar,
/// while the `maxHeight` property represents the maximum height. The app bar will
/// smoothly transition its size based on the user's scroll behavior.
///
/// The `child` property allows you to provide a custom widget that will be displayed
/// within the app bar space. This can include any Flutter widgets, such as images,
/// text, icons, or custom UI elements.
///
/// Example Implementation:
/// ```dart
/// SliverAppBarDelegate(
///   minHeight: 80.0,
///   maxHeight: 200.0,
///   child: Container(
///     color: Colors.blue,
///     child: Center(
///       child: Text(
///         'Custom App Bar Content',
///         style: TextStyle(color: Colors.white, fontSize: 18.0),
///       ),
///     ),
///   ),
/// );
/// ```
///
/// Note: Make sure to use this delegate within a CustomScrollView, typically in the
/// `slivers` property of a CustomScrollView widget, to achieve the desired flexible
/// app bar behavior.
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  /// Creates a SliverAppBarDelegate with the specified minHeight, maxHeight, and child.
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  /// The minimum height of the app bar when fully collapsed.
  final double minHeight;

  /// The maximum height of the app bar when fully expanded.
  final double maxHeight;

  /// The child widget that will be displayed within the app bar space.
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
