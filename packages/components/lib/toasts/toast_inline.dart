// ignore_for_file: deprecated_member_use

import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastInlineType {
  error,
  info,
  success,
  warning,
  neutral;

  Color get color => switch (this) {
        ToastInlineType.error => AppColors.danger500,
        ToastInlineType.info => AppColors.info500,
        ToastInlineType.success => AppColors.primary500,
        ToastInlineType.warning => AppColors.warning600,
        ToastInlineType.neutral => AppColors.textLightDark,
      };

  Color get backgroundColor => switch (this) {
        ToastInlineType.error => AppColors.danger100,
        ToastInlineType.info => AppColors.info100,
        ToastInlineType.success => AppColors.primary100,
        ToastInlineType.warning => AppColors.warning100,
        ToastInlineType.neutral => AppColors.backgroundLight,
      };

  Widget get iconPath => switch (this) {
        ToastInlineType.error => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.info => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.success => Assets.icons.checkCircle.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.warning => Assets.icons.warning.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.neutral => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
      };
}

/// The `ToastInline` widget displays a simple inline toast with a customizable message and optional icon.
/// It is designed to provide visual feedback to users for various types of information such as errors,
/// success messages, warnings, and more.
///
/// ## Usage
/// To use `ToastInline`, create an instance of the widget by specifying the `message` and `type`.
/// You can customize its appearance by setting parameters such as `isWithIcon`.
///
/// Example:
/// ```dart
/// // Create an inline toast with an error message and an icon
/// ToastInline.error(
///   message: 'Error occurred!',
///   isWithIcon: true,
/// );
///
/// // Create an inline toast with a success message without an icon
/// ToastInline.success(
///   message: 'Operation successful!',
///   isWithIcon: false,
/// );
/// ```
///
/// ## Parameters
/// - `message`: The message to be displayed in the inline toast.
/// - `type`: The type of inline toast, which determines its color, background color, and icon.
/// - `isWithIcon`: Set to `true` to display an icon with the inline toast, or `false` to hide it.
///
/// Example:
/// ```dart
/// // Create an inline toast with a warning message and an icon
/// ToastInline.warning(
///   message: 'Proceed with caution!',
///   isWithIcon: true,
/// );
/// ```
class ToastInline extends StatelessWidget {
  /// Creates an inline toast with an error message and an optional icon.
  ///
  /// The `message` parameter represents the content of the inline toast.
  /// The `isWithIcon` parameter determines whether to display an icon with the inline toast.
  ///
  /// Example:
  /// ```dart
  /// // Create an inline toast with an error message and an icon
  /// ToastInline.error(
  ///   message: 'Error occurred!',
  ///   isWithIcon: true,
  /// );
  /// ```
  const ToastInline.error({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.error;

  /// Creates an inline toast with an information message and an optional icon.
  ///
  /// The `message` parameter represents the content of the inline toast.
  /// The `isWithIcon` parameter determines whether to display an icon with the inline toast.
  ///
  /// Example:
  /// ```dart
  /// // Create an inline toast with an information message and an icon
  /// ToastInline.info(
  ///   message: 'Additional information!',
  ///   isWithIcon: true,
  /// );
  /// ```
  const ToastInline.info({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.info;

  /// Creates an inline toast with a success message and an optional icon.
  ///
  /// The `message` parameter represents the content of the inline toast.
  /// The `isWithIcon` parameter determines whether to display an icon with the inline toast.
  ///
  /// Example:
  /// ```dart
  /// // Create an inline toast with a success message and an icon
  /// ToastInline.success(
  ///   message: 'Operation successful!',
  ///   isWithIcon: true,
  /// );
  /// ```
  const ToastInline.success({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.success;

  /// Creates an inline toast with a warning message and an optional icon.
  ///
  /// The `message` parameter represents the content of the inline toast.
  /// The `isWithIcon` parameter determines whether to display an icon with the inline toast.
  ///
  /// Example:
  /// ```dart
  /// // Create an inline toast with a warning message and an icon
  /// ToastInline.warning(
  ///   message: 'Proceed with caution!',
  ///   isWithIcon: true,
  /// );
  /// ```
  const ToastInline.warning({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.warning;

  /// Creates an inline toast with a neutral message and an optional icon.
  ///
  /// The `message` parameter represents the content of the inline toast.
  /// The `isWithIcon` parameter determines whether to display an icon with the inline toast.
  ///
  /// Example:
  /// ```dart
  /// // Create an inline toast with a neutral message and an icon
  /// ToastInline.neutral(
  ///   message: 'A neutral message.',
  ///   isWithIcon: true,
  /// );
  /// ```
  const ToastInline.neutral({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.neutral;

  final String message;
  final ToastInlineType type;
  final bool isWithIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 8.w,
      ),
      decoration: ShapeDecoration(
        color: type.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isWithIcon) ...[
            type.iconPath,
            SizedBox(width: 4.w),
          ],
          Expanded(
            child: Text(
              message,
              style: AppTypography.body.toColor(type.color),
            ),
          ),
        ],
      ),
    );
  }
}
