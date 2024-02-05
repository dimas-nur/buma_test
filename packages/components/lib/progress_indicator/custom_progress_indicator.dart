import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `CustomProgressIndicator` widget provides a customizable circular progress indicator.
/// It can be used to visually indicate that a process is ongoing or to represent the loading state.
///
/// ## Usage
/// To use `CustomProgressIndicator`, create an instance of the widget, and you can customize
/// its appearance by setting parameters such as `size`, `strokeWidth`, and `color`. You can use
/// it as a regular widget or within a `Sliver` context using the `sliver` constructor.
///
/// Example:
/// ```dart
/// // Create a regular circular progress indicator
/// CustomProgressIndicator(
///   size: 24.0,
///   strokeWidth: 2.0,
///   color: AppColors.iconDark,
/// );
///
/// // Create a sliver circular progress indicator
/// CustomProgressIndicator.sliver(
///   size: 24.0,
///   strokeWidth: 2.0,
///   color: AppColors.iconDark,
/// );
/// ```
///
/// ## Parameters
/// - `size`: The size of the circular progress indicator. Defaults to `24.0`.
/// - `strokeWidth`: The width of the circular progress indicator's stroke. Defaults to `2.0`.
/// - `color`: The color of the circular progress indicator. Defaults to `AppColors.iconDark`.
/// - `isSliver`: Set to `true` to use the sliver version of the progress indicator.
///
/// Example:
/// ```dart
/// // Create a sliver circular progress indicator
/// CustomProgressIndicator.sliver(
///   size: 24.0,
///   strokeWidth: 2.0,
///   color: AppColors.iconDark,
/// );
/// ```
class CustomProgressIndicator extends StatelessWidget {
  /// Creates a circular progress indicator with the specified `size`, `strokeWidth`, and `color`.
  ///
  /// The `size` parameter defines the dimensions of the circular progress indicator.
  /// The `strokeWidth` parameter sets the width of the circular progress indicator's stroke.
  /// The `color` parameter defines the color of the circular progress indicator.
  ///
  /// Example:
  /// ```dart
  /// // Create a regular circular progress indicator
  /// CustomProgressIndicator(
  ///   size: 24.0,
  ///   strokeWidth: 2.0,
  ///   color: AppColors.iconDark,
  /// );
  /// ```
  const CustomProgressIndicator({
    super.key,
    this.size,
    this.strokeWidth = 2,
    this.color = AppColors.iconDark,
  }) : isSliver = false;

  const CustomProgressIndicator.sliver({
    super.key,
    this.size,
    this.strokeWidth = 2,
    this.color,
  }) : isSliver = true;

  final double? size;
  final double strokeWidth;
  final Color? color;
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(
            child: _child(),
          )
        : _child();
  }

  Widget _child() {
    return SizedBox(
      width: size ?? 24.r,
      height: size ?? 24.r,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
        valueColor:
            color != null ? AlwaysStoppedAnimation<Color>(color!) : null,
      ),
    );
  }
}
