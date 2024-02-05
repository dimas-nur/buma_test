import 'package:components/components.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType {
  info,
  success,
  error,
  confirmation;

  String get title => switch (this) {
        DialogType.info => 'Information',
        DialogType.success => 'Woohoo!',
        DialogType.error => 'Oops!',
        DialogType.confirmation => 'Confirmation',
      };

  String get illustrationPath => switch (this) {
        DialogType.info => Assets.illustrations.dialogInformation.path,
        DialogType.success => Assets.illustrations.dialogSuccess.path,
        DialogType.error => Assets.illustrations.dialogError.path,
        DialogType.confirmation => Assets.illustrations.dialogConfirmation.path,
      };
}

/// The `CustomDialog` widget is a versatile dialog that can be used to display
/// informational messages, success messages, error messages, or confirmation dialogs.
///
/// ## Usage
/// To use `CustomDialog`, create an instance of the widget with the desired `type`
/// and provide the `message` to be displayed. You can customize other properties
/// such as `textActionPositive`, `onPositiveTap`, `textActionNegative`, and `onNegativeTap`.
///
/// Example:
/// ```dart
/// // Create a confirmation dialog
/// CustomDialog.confirmation(
///   message: 'Are you sure you want to continue?',
///   onPositiveTap: () {
///     // Handle positive action
///   },
///   onNegativeTap: () {
///     // Handle negative action or close the dialog
///   },
/// );
/// ```
///
/// ## Parameters
/// - `type`: The type of the dialog, such as info, success, error, or confirmation.
/// - `message`: The main message to be displayed in the dialog.
/// - `textActionPositive`: The text for the positive action button. Default is 'Tutup' or 'Lanjutkan' based on the `type`.
/// - `onPositiveTap`: Callback function to handle the positive action button tap.
/// - `textActionNegative`: The text for the negative action button. Default is 'Batal' for confirmation dialogs.
/// - `onNegativeTap`: Callback function to handle the negative action button tap.
///
/// Example:
/// ```dart
/// // Create an informational dialog
/// CustomDialog.info(
///   message: 'This is an informational message.',
///   onPositiveTap: () {
///     // Handle positive action or close the dialog
///   },
/// );
/// ```
class CustomDialog extends StatelessWidget {
  /// Creates an informational dialog.
  ///
  /// The `message` parameter is required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create an informational dialog
  /// CustomDialog.info(
  ///   message: 'This is an informational message.',
  ///   onPositiveTap: () {
  ///     // Handle positive action or close the dialog
  ///   },
  /// );
  /// ```
  const CustomDialog.info({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.info;

  /// Creates a success dialog.
  ///
  /// The `message` parameter is required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create a success dialog
  /// CustomDialog.success(
  ///   message: 'Operation successful!',
  ///   onPositiveTap: () {
  ///     // Handle positive action or close the dialog
  ///   },
  /// );
  /// ```
  const CustomDialog.success({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.success;

  /// Creates an error dialog.
  ///
  /// The `message` parameter is required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create an error dialog
  /// CustomDialog.error(
  ///   message: 'An error occurred. Please try again.',
  ///   onPositiveTap: () {
  ///     // Handle positive action or close the dialog
  ///   },
  /// );
  /// ```
  const CustomDialog.error({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.error;

  /// Creates a confirmation dialog.
  ///
  /// The `message` parameter is required. Other parameters are optional.
  ///
  /// Example:
  /// ```dart
  /// // Create a confirmation dialog
  /// CustomDialog.confirmation(
  ///   message: 'Are you sure you want to continue?',
  ///   onPositiveTap: () {
  ///     // Handle positive action
  ///   },
  ///   onNegativeTap: () {
  ///     // Handle negative action or close the dialog
  ///   },
  /// );
  /// ```
  const CustomDialog.confirmation({
    super.key,
    required this.message,
    this.textActionPositive = 'Lanjutkan',
    this.onPositiveTap,
    this.textActionNegative = 'Batalkan',
    this.onNegativeTap,
  }) : type = DialogType.confirmation;

  final DialogType type;
  final String message;
  final String textActionPositive;
  final VoidCallback? onPositiveTap;
  final String? textActionNegative;
  final VoidCallback? onNegativeTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.backgroundWhite,
      backgroundColor: AppColors.backgroundWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      insetPadding: EdgeInsets.symmetric(
        vertical: 48.h,
        horizontal: 48.w,
      ),
      child: CustomColumn(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgGenImage(type.illustrationPath).svg(
            width: 100.r,
            height: 100.r,
          ),
          Gap.h16,
          Text(
            type.title,
            style: AppTypography.h5,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Text(
            message,
            style: AppTypography.body.colorDark,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Row(
            children: [
              if (type == DialogType.confirmation) ...[
                Expanded(
                  child: CustomButton.secondary(
                    onPressed: onNegativeTap ?? () => Navigator.pop(context),
                    isStretched: true,
                    text: textActionNegative ?? 'Batal',
                  ),
                ),
                Gap.w16,
              ],
              Expanded(
                child: CustomButton.primary(
                  onPressed: onPositiveTap ?? () => Navigator.pop(context),
                  isStretched: true,
                  text: textActionPositive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
