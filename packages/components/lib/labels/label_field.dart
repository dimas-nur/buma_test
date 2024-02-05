import 'package:components/gaps/gap.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `LabelField` widget is designed to display a label with optional
/// indicators such as a '*' for required fields and an icon. It's commonly
/// used in form fields or data input sections to provide users with
/// information about the associated input.
///
/// ## Usage
/// To use `LabelField`, create an instance of the widget with the required
/// `label` parameter. You can also set the `required` parameter to `true` to
/// display a '*' indicating that the associated field is required. Additionally,
/// you can include an `iconPath` parameter to display an icon next to the label.
///
/// Example:
/// ```dart
/// // Create a label field with a label, required indicator, and icon
/// LabelField(
///   label: 'Username',
///   required: true,
///   iconPath: Assets.icons.username.path,
/// );
///
/// // Create a label field with a label only
/// LabelField(
///   label: 'Email Address',
/// );
/// ```
///
/// ## Parameters
/// - `label`: The label text to be displayed.
/// - `required`: Set to `true` to display a '*' indicating that the associated field is required.
/// - `iconPath`: The path to the icon asset to be displayed next to the label.
///
/// Example:
/// ```dart
/// // Create a label field with a label, required indicator, and icon
/// LabelField(
///   label: 'Username',
///   required: true,
///   iconPath: Assets.icons.username.path,
/// );
/// ```
class LabelField extends StatelessWidget {
  /// Creates a label field with the specified `label`, `required` indicator, and optional `icon`.
  ///
  /// The `label` parameter is the text to be displayed as the label.
  ///
  /// Example:
  /// ```dart
  /// // Create a label field with a label only
  /// LabelField(
  ///   label: 'Email Address',
  /// );
  /// ```
  const LabelField({
    super.key,
    required this.label,
    this.required = false,
    this.iconPath,
  });

  final String label;
  final bool required;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.body.colorDark,
            ),
            if (required) ...[
              Gap.w4,
              Text(
                '*',
                style: AppTypography.body.toColor(
                  AppColors.danger500,
                ),
              ),
            ],
            if (iconPath != null) ...[
              Gap.w4,
              SvgGenImage(iconPath!).svg(
                width: 16.r,
                height: 16.r,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
