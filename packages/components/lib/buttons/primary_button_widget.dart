import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `PrimaryIconButton` is a customizable widget that represents a primary
/// action button in a Flutter application. It can be used with either a predefined
/// icon type or a custom icon. The button is styled according to the application's
/// color scheme and size standards.
///
/// ## Usage
/// To use a `PrimaryIconButton`, you can either provide a predefined icon type
/// through the `type` parameter or a custom icon through the `icon` parameter.
/// You must also specify the `onPressed` callback to handle button presses.
///
/// ```dart
/// PrimaryIconButton.type(
///   onPressed: () {
///     // Handle button press
///   },
///   type: PrimaryIconButtonType.close,
/// )
/// ```
///
/// ```dart
/// PrimaryIconButton.custom(
///   onPressed: () {
///     // Handle button press
///   },
///   icon: Icon(Icons.favorite),
/// )
/// ```
///
/// ## Parameters
/// - `onPressed`: Callback function to be executed when the button is pressed.
/// - `type`: Predefined icon type from the `PrimaryIconButtonType` enum.
/// - `icon`: Custom icon widget to be used as the button's icon.
/// - `tooltip`: Tooltip text to be displayed when the button is long-pressed.
/// - `isLightColor`: A boolean indicating whether the button should use light
///   or dark colors from the application color scheme.
///
/// Example:
/// ```dart
/// PrimaryIconButton.custom(
///   onPressed: () {
///     // Handle button press
///   },
///   icon: Icon(Icons.favorite),
///   tooltip: 'Favorite',
///   isLightColor: true,
/// )
/// ```
class PrimaryIconButton extends StatelessWidget {
  /// Creates a `PrimaryIconButton` with a predefined icon type.
  const PrimaryIconButton.type({
    super.key,
    required this.onPressed,
    required this.type,
    this.isLightColor = false,
  })  : icon = null,
        tooltip = null;

  /// Creates a `PrimaryIconButton` with a custom icon.
  const PrimaryIconButton.custom({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.isLightColor = false,
  }) : type = null;

  final void Function()? onPressed;
  final PrimaryIconButtonType? type;
  final Widget? icon;
  final String? tooltip;
  final bool isLightColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.r,
      width: 32.r,
      child: IconButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        icon: type?.icon != null
            ? Icon(
                type!.icon,
                size: 24.r,
                color: isLightColor ? AppColors.iconWhite : AppColors.iconDark,
              )
            : icon ?? const SizedBox.shrink(),
        splashRadius: 32.r,
        tooltip: type?.tooltip ?? tooltip,
      ),
    );
  }
}

/// The `PrimaryIconButtonType` enum represents predefined types of icons
/// that can be used with the `PrimaryIconButton` widget. Each enum value
/// includes an associated IconData for the icon representation and a tooltip
/// string to describe the action when the icon is long-pressed.
///
/// ## Usage
/// This enum is typically used when creating instances of the `PrimaryIconButton`
/// widget to easily select a specific icon type.
///
/// Example:
/// ```dart
/// PrimaryIconButton.type(
///   onPressed: () {
///     // Handle button press
///   },
///   type: PrimaryIconButtonType.close,
/// )
/// ```
///
/// Enum Values:
/// - `close`: Represents a close icon with the associated `Icons.close_rounded` and
///   'Close' tooltip.
/// - `search`: Represents a search icon with the associated `Icons.search_rounded` and
///   'Search' tooltip.
/// - `back`: Represents a back arrow icon with the associated `Icons.arrow_back_rounded` and
///   'Back' tooltip.
///
/// Example:
/// ```dart
/// PrimaryIconButton.type(
///   onPressed: () {
///     // Handle button press
///   },
///   type: PrimaryIconButtonType.back,
/// )
/// ```
enum PrimaryIconButtonType {
  /// Represents a close icon.
  close._(Icons.close_rounded, 'Close'),

  /// Represents a search icon.
  search._(Icons.search_rounded, 'Search'),

  /// Represents a back arrow icon.
  back._(Icons.arrow_back_rounded, 'Back'),

  /// Represents a notification icon.
  notification._(Icons.notifications_rounded, 'Notification');

  const PrimaryIconButtonType._(this.icon, this.tooltip);

  /// The icon data associated with the icon type.
  final IconData icon;

  /// The tooltip text associated with the icon type.
  final String tooltip;
}
