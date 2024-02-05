import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `PrimaryDivider` widget is a versatile divider that can be used to separate
/// sections either vertically or horizontally. It allows customization of its
/// dimensions, border width, rounded corners, and transparency.
///
/// ## Usage
/// To use `PrimaryDivider`, create an instance of the widget with either
/// `vertical` or `horizontal` orientation. You can customize the `height` for
/// vertical dividers or `width` for horizontal dividers. Additionally, you can
/// specify the `borderWidth`, `isRounded` to add rounded corners, and `isTransparency`
/// to make the divider semi-transparent.
///
/// Example:
/// ```dart
/// // Create a vertical divider with custom height and rounded corners
/// PrimaryDivider.vertical(
///   height: 100.h,
///   borderWidth: 2,
///   isRounded: true,
/// );
///
/// // Create a horizontal divider with default width and transparency
/// PrimaryDivider.horizontal(
///   isTransparency: true,
/// );
/// ```
///
/// ## Parameters
/// - `height`: The height of the vertical divider. Set to `null` for infinite height.
/// - `width`: The width of the horizontal divider. Set to `null` for infinite width.
/// - `borderWidth`: The width of the divider border.
/// - `isRounded`: Set to `true` to add rounded corners to the divider.
/// - `isTransparency`: Set to `true` to make the divider semi-transparent.
///
/// Example:
/// ```dart
/// // Create a horizontal divider with rounded corners and transparency
/// PrimaryDivider.horizontal(
///   isRounded: true,
///   isTransparency: true,
/// );
/// ```
class PrimaryDivider extends StatelessWidget {
  /// Creates a vertical divider with custom height, border width, rounded corners,
  /// and transparency.
  ///
  /// The `height` parameter defines the height of the vertical divider.
  ///
  /// Example:
  /// ```dart
  /// // Create a vertical divider with custom height and rounded corners
  /// PrimaryDivider.vertical(
  ///   height: 100.h,
  ///   borderWidth: 2,
  ///   isRounded: true,
  /// );
  /// ```
  const PrimaryDivider.vertical({
    super.key,
    this.height,
    this.borderWidth = 1,
    this.isRounded = true,
    this.isTransparency = false,
  }) : width = borderWidth;

  /// Creates a horizontal divider with custom width, border width, rounded corners,
  /// and transparency.
  ///
  /// The `width` parameter defines the width of the horizontal divider.
  ///
  /// Example:
  /// ```dart
  /// // Create a horizontal divider with default width and transparency
  /// PrimaryDivider.horizontal(
  ///   isTransparency: true,
  /// );
  /// ```
  const PrimaryDivider.horizontal({
    super.key,
    this.width,
    this.borderWidth = 1,
    this.isRounded = true,
    this.isTransparency = false,
  }) : height = borderWidth;

  final double? height;
  final double? width;
  final double borderWidth;
  final bool isRounded;
  final bool isTransparency;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? double.infinity,
      width: width?.w ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.strokeTertiary.withOpacity(isTransparency ? 0.5 : 1),
        borderRadius: isRounded ? BorderRadius.circular(borderWidth.r) : null,
      ),
    );
  }
}
