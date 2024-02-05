import 'package:components/wrappers/custom_inkwell.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// The `PrimaryCard` widget is a customizable card with optional ripple effect.
/// It is designed to be used as a basic building block for creating cards in your app.
///
/// ## Usage
/// To use `PrimaryCard`, create an instance of the widget and provide the content
/// that should be displayed within the card. You can customize various properties
/// such as `width`, `height`, `padding`, `margin`, `borderRadius`, `backgroundColor`,
/// `isWithBorder`, `borderColor`, `borderWidth`, and `splashColor`.
///
/// Example:
/// ```dart
/// // Create a PrimaryCard with custom properties and a ripple effect
/// PrimaryCard(
///   onTap: () {
///     // Handle tap event
///   },
///   child: YourContentWidget(),
///   width: 200,
///   height: 150,
///   padding: EdgeInsets.all(16.r),
///   margin: EdgeInsets.all(8.r),
///   borderRadius: BorderRadius.circular(10.r),
///   backgroundColor: Colors.white,
///   isWithBorder: true,
///   borderColor: Colors.grey,
///   borderWidth: 1,
///   splashColor: Colors.grey.shade800,
/// );
/// ```
///
/// ## Parameters
/// - `onTap`: Callback function to handle tap events. If `onTap` is provided,
///   the card will have a ripple effect.
/// - `child`: The content to be displayed within the card.
/// - `width`: The width of the card.
/// - `height`: The height of the card.
/// - `padding`: Optional padding around the content inside the card.
/// - `margin`: Optional margin around the card.
/// - `borderRadius`: Optional border radius for the card.
/// - `backgroundColor`: Background color of the card.
/// - `isWithBorder`: Whether to include a border around the card.
/// - `borderColor`: Color of the card's border.
/// - `borderWidth`: Width of the card's border.
/// - `splashColor`: Color of the ripple effect when tapped.
///
/// Example:
/// ```dart
/// // Create a PrimaryCard with custom properties and a ripple effect
/// PrimaryCard(
///   onTap: () {
///     // Handle tap event
///   },
///   child: YourContentWidget(),
///   width: 200,
///   height: 150,
///   padding: EdgeInsets.all(16.r),
///   margin: EdgeInsets.all(8.r),
///   borderRadius: BorderRadius.circular(10.r),
///   backgroundColor: Colors.white,
///   isWithBorder: true,
///   borderColor: Colors.grey,
///   borderWidth: 1,
///   splashColor: Colors.grey.shade800,
/// );
/// ```
class PrimaryCard extends StatelessWidget {
  /// Creates a PrimaryCard.
  ///
  /// The `onTap` and `child` parameters are required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create a PrimaryCard with custom properties and a ripple effect
  /// PrimaryCard(
  ///   onTap: () {
  ///     // Handle tap event
  ///   },
  ///   child: YourContentWidget(),
  ///   width: 200,
  ///   height: 150,
  ///   padding: EdgeInsets.all(16.r),
  ///   margin: EdgeInsets.all(8.r),
  ///   borderRadius: BorderRadius.circular(10.r),
  ///   backgroundColor: Colors.white,
  ///   isWithBorder: true,
  ///   borderColor: Colors.grey,
  ///   borderWidth: 1,
  ///   splashColor: Colors.grey.shade800,
  /// );
  /// ```
  const PrimaryCard({
    super.key,
    this.onTap,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = AppColors.backgroundWhite,
    this.isWithBorder = true,
    this.borderColor = AppColors.strokeTertiary,
    this.borderWidth = 1,
    this.splashColor = AppColors.neutral800,
  }) : isRippleOnTop = false;

  /// Creates a PrimaryCard with a ripple effect on top.
  ///
  /// The `onTap` and `child` parameters are required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create a PrimaryCard with custom properties and a ripple effect on top
  /// PrimaryCard.topRipple(
  ///   onTap: () {
  ///     // Handle tap event
  ///   },
  ///   child: YourContentWidget(),
  ///   width: 200,
  ///   height: 150,
  ///   padding: EdgeInsets.all(16.r),
  ///   margin: EdgeInsets.all(8.r),
  ///   borderRadius: BorderRadius.circular(10.r),
  ///   backgroundColor: Colors.white,
  ///   isWithBorder: true,
  ///   borderColor: Colors.grey,
  ///   borderWidth: 1,
  ///   splashColor: Colors.grey.shade800,
  /// );
  /// ```
  const PrimaryCard.topRipple({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = AppColors.backgroundWhite,
    this.isWithBorder = true,
    this.borderColor = AppColors.strokeTertiary,
    this.borderWidth = 1,
    this.splashColor = AppColors.neutral800,
  }) : isRippleOnTop = true;

  /// Callback function to handle tap events. If `onTap` is provided, the card will
  /// have a ripple effect.
  final void Function()? onTap;

  /// The content to be displayed within the card.
  final Widget child;

  /// The width of the card.
  final double? width;

  /// The height of the card.
  final double? height;

  /// Optional padding around the content inside the card.
  final EdgeInsetsGeometry? padding;

  /// Optional margin around the card.
  final EdgeInsetsGeometry? margin;

  /// Optional border radius for the card.
  final BorderRadius? borderRadius;

  /// Background color of the card.
  final Color backgroundColor;

  /// Whether to include a border around the card.
  final bool isWithBorder;

  /// Color of the card's border.
  final Color borderColor;

  /// Width of the card's border.
  final double borderWidth;

  /// Color of the ripple effect when tapped.
  final Color splashColor;

  /// Indicates whether the ripple effect is on top of the card.
  final bool isRippleOnTop;

  EdgeInsetsGeometry get _padding => padding ?? EdgeInsets.all(16.r);
  BorderRadius get _borderRadius => borderRadius ?? BorderRadius.circular(10.r);
  bool get _isWithBorder => isWithBorder && borderWidth != 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: (_borderRadius).add(
          BorderRadius.all(
            Radius.circular(
              _isWithBorder ? 2 : 0,
            ),
          ),
        ),
        border: _isWithBorder
            ? Border.all(
                color: borderColor,
                width: borderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              )
            : null,
      ),
      child: isRippleOnTop
          ? _body()
          : CustomInkWell(
              onTap: onTap,
              splashColor: splashColor,
              borderRadius: _borderRadius,
              child: _body(),
            ),
    );
  }

  Widget _body() {
    return ClipRRect(
      borderRadius: _borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: _padding,
            child: child,
          ),
          if (onTap != null)
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: CustomInkWell(
                onTap: onTap,
                splashColor: splashColor,
              ),
            ),
        ],
      ),
    );
  }
}
