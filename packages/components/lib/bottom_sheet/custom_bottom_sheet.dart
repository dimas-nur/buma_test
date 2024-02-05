import 'package:components/gaps/gap.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wrappers/custom_flex.dart';

/// The `CustomBottomSheet` widget is a customizable bottom sheet that can be used
/// to display content from the bottom of the screen. It provides a visually pleasing
/// design with a header and customizable padding for the content.
///
/// ## Usage
/// To use `CustomBottomSheet`, create an instance of the widget and provide the
/// content that should be displayed in the bottom sheet. You can also customize
/// the padding using the optional `padding` parameter.
///
/// Example:
/// ```dart
/// // Create a CustomBottomSheet with a child widget and custom padding
/// CustomBottomSheet(
///   child: YourContentWidget(),
///   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
/// );
/// ```
///
/// ## Parameters
/// - `child`: The content to be displayed within the bottom sheet.
/// - `padding`: Optional padding around the content. Defaults to a standard
///   padding with 8.h top, 16.w left and right, and 64.h bottom.
///
/// Example:
/// ```dart
/// // Create a CustomBottomSheet with a child widget and custom padding
/// CustomBottomSheet(
///   child: YourContentWidget(),
///   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
/// );
/// ```
class CustomBottomSheet extends StatelessWidget {
  /// Creates a CustomBottomSheet.
  ///
  /// The `child` parameter is required, and `padding` is optional.
  ///
  /// Example:
  /// ```dart
  /// // Create a CustomBottomSheet with a child widget and custom padding
  /// CustomBottomSheet(
  ///   child: YourContentWidget(),
  ///   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  /// );
  /// ```
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.padding,
  });

  /// The content to be displayed within the bottom sheet.
  final Widget child;

  /// Optional padding around the content. Defaults to a standard padding with
  /// 8.h top, 16.w left and right, and 64.h bottom.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: 8.h,
            left: 16.w,
            right: 16.w,
            bottom: 64.h,
          ),
      child: CustomColumn(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24.w,
            height: 4.h,
            decoration: ShapeDecoration(
              color: AppColors.iconLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          Gap.h16,
          child,
        ],
      ),
    );
  }
}
