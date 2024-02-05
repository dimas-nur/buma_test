import 'package:components/gaps/gap.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../progress_indicator/custom_progress_indicator.dart';

enum CustomButtonType {
  primary(AppColors.info500, AppColors.textWhite),
  secondary(AppColors.backgroundLight, AppColors.textDark),
  tertiary(Colors.transparent, AppColors.primary500);

  const CustomButtonType(this.backgroundColor, this.textColor);

  final Color backgroundColor;
  final Color textColor;
}

/// The `CustomButton` widget is a versatile button designed for use in Flutter applications.
/// It provides three button types: `primary`, `secondary`, and `tertiary`. Each type has a
/// distinct visual style based on its background and text colors.
///
/// ## Usage
/// To use `CustomButton`, create an instance of the widget with the desired button type,
/// provide an `onPressed` callback, and specify the button text using the `text` parameter.
/// Additional customization options include enabling the loading state (`isLoading`), making
/// the button stretched (`isStretched`), and customizing the background and text colors with
/// the `type` parameter.
///
/// Example:
/// ```dart
/// // Primary Button with onPressed callback and custom text
/// CustomButton.primary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Primary Button',
/// );
///
/// // Secondary Button with loading state and stretched layout
/// CustomButton.secondary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Secondary Button',
///   isLoading: true,
///   isStretched: true,
/// );
///
/// // Tertiary Button with custom background and text colors
/// CustomButton.tertiary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Tertiary Button',
///   type: CustomButtonType.tertiary,
/// );
/// ```
///
/// ## Parameters
/// - `onPressed`: Callback function to be executed when the button is pressed. If the button is in
///    the loading state, the callback won't be triggered.
/// - `text`: The text displayed on the button.
/// - `isLoading`: A flag indicating whether the button is in a loading state. If set to `true`,
///    the button will display a loading indicator instead of the regular text.
/// - `type`: The type of the button, which determines its visual style. Available types are `primary`,
///    `secondary`, and `tertiary`. Defaults to `primary`.
/// - `isStretched`: A flag indicating whether the button should stretch to fill the available width.
///    Defaults to `false`.
///
/// Example:
/// ```dart
/// // Primary Button with onPressed callback and custom text
/// CustomButton.primary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Primary Button',
/// );
///
/// // Secondary Button with loading state and stretched layout
/// CustomButton.secondary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Secondary Button',
///   isLoading: true,
///   isStretched: true,
/// );
///
/// // Tertiary Button with custom background and text colors
/// CustomButton.tertiary(
///   onPressed: () {
///     // Handle button press
///   },
///   text: 'Tertiary Button',
///   type: CustomButtonType.tertiary,
/// );
/// ```
class CustomButton extends StatefulWidget {
  /// Creates a primary CustomButton.
  ///
  /// The `onPressed` callback and `text` parameters are required.
  /// - `onPressed`: Callback function to be executed when the button is pressed.
  /// - `text`: The text displayed on the button.
  ///
  /// Optional parameters:
  /// - `isLoading`: A flag indicating whether the button is in a loading state. Defaults to `false`.
  /// - `isStretched`: A flag indicating whether the button should stretch to fill the available width.
  ///   Defaults to `false`.
  const CustomButton.primary({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isStretched = false,
    this.prefixIconPath,
  }) : type = CustomButtonType.primary;

  /// Creates a secondary CustomButton.
  ///
  /// The `onPressed` callback and `text` parameters are required.
  /// - `onPressed`: Callback function to be executed when the button is pressed.
  /// - `text`: The text displayed on the button.
  ///
  /// Optional parameters:
  /// - `isLoading`: A flag indicating whether the button is in a loading state. Defaults to `false`.
  /// - `isStretched`: A flag indicating whether the button should stretch to fill the available width.
  ///   Defaults to `false`.
  const CustomButton.secondary({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isStretched = false,
    this.prefixIconPath,
  }) : type = CustomButtonType.secondary;

  /// Creates a tertiary CustomButton.
  ///
  /// The `onPressed` callback and `text` parameters are required.
  /// - `onPressed`: Callback function to be executed when the button is pressed.
  /// - `text`: The text displayed on the button.
  ///
  /// Optional parameters:
  /// - `isLoading`: A flag indicating whether the button is in a loading state. Defaults to `false`.
  /// - `isStretched`: A flag indicating whether the button should stretch to fill the available width.
  ///   Defaults to `false`.
  const CustomButton.tertiary({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isStretched = false,
    this.prefixIconPath,
  }) : type = CustomButtonType.tertiary;

  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  final CustomButtonType type;
  final bool isStretched;
  final String? prefixIconPath;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapped = false;

  bool get isEnabled => widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onPressed,
      onTapDown: (_) => widget.isLoading || widget.onPressed == null
          ? null
          : setState(() => isTapped = true),
      onTapUp: (_) => widget.isLoading || widget.onPressed == null
          ? null
          : setState(() => isTapped = false),
      onTapCancel: () => widget.isLoading || widget.onPressed == null
          ? null
          : setState(() => isTapped = false),
      child: SizedBox(
        height: 40.h,
        child: Stack(
          children: [
            if (widget.type != CustomButtonType.tertiary)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.type.backgroundColor
                        .withOpacity(widget.isLoading || !isEnabled ? 0.5 : 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
            if (!widget.isLoading && isEnabled)
              Positioned.fill(
                left: 1,
                top: 1,
                right: 1,
                bottom: 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      if (isTapped)
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              widget.type == CustomButtonType.tertiary
                                  ? 0.1
                                  : 0.25),
                        ),
                      BoxShadow(
                        color: widget.type.backgroundColor,
                        spreadRadius: -2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            widget.isStretched ? Positioned.fill(child: _child) : _child,
          ],
        ),
      ),
    );
  }

  Widget get _child {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: widget.type == CustomButtonType.secondary
              ? const BorderSide(
                  color: AppColors.strokeTertiary,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      child: widget.isLoading
          ? CustomProgressIndicator(
              color: widget.type.textColor,
              size: 14.r,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.prefixIconPath != null) ...[
                  SvgGenImage(widget.prefixIconPath!).svg(
                    width: 16.w,
                    height: 16.h,
                    // ignore: deprecated_member_use
                    color:
                        widget.type.textColor.withOpacity(isEnabled ? 1 : 0.5),
                  ),
                  Gap.w4,
                ],
                Flexible(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: AppTypography.body.toColor(
                      widget.type.textColor.withOpacity(isEnabled ? 1 : 0.5),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );
  }
}
