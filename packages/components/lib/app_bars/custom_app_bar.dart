import 'package:components/buttons/custom_icon_button.dart';
import 'package:components/gaps/gap.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// The `CustomAppBar` widget is a versatile app bar designed for use in Flutter applications.
/// It provides a consistent layout for the app bar with a title, optional leading widget (e.g.,
/// close or back button), actions, and customizable background color.
///
/// ## Usage
/// To use `CustomAppBar`, create an instance of the widget with either the `primary` or `secondary`
/// constructor, depending on the desired style. Customize the app bar further by providing optional
/// parameters such as `title`, `leading`, `actions`, `automaticallyImplyLeading`, `onBackPressed`,
/// and `backgroundColor`.
///
/// Example:
/// ```dart
/// // Primary App Bar with a close button and white background
/// CustomAppBar.primary(
///   title: 'Profile',
///   leading: Icon(Icons.close),
///   backgroundColor: Colors.white,
/// );
///
/// // Secondary App Bar with a back button and default background
/// CustomAppBar.secondary(
///   title: 'Settings',
///   onBackPressed: () {
///     // Handle back button press
///   },
/// );
/// ```
///
/// ## Parameters
/// - `title`: The title displayed in the app bar.
/// - `leading`: A widget to be displayed leading the title. If not provided, it defaults to a close
///    button for the primary style and a back button for the secondary style.
/// - `actions`: A list of widgets to be displayed at the end of the app bar, such as action buttons.
/// - `automaticallyImplyLeading`: Determines whether to automatically include a leading widget if
///    the screen is part of a navigation stack.
/// - `onBackPressed`: A callback function to be executed when the leading widget (close or back button)
///    is pressed. If not provided, the default behavior is to pop the current route.
/// - `backgroundColor`: The background color of the app bar. Defaults to white for primary style and
///    `AppColors.backgroundWhite` for the secondary style.
/// - `isPrimary`: A flag indicating whether the app bar should have a primary or secondary style.
///    Defaults to `true` for the primary style.
///
/// Example:
/// ```dart
/// // Primary App Bar with a close button and white background
/// CustomAppBar.primary(
///   title: 'Profile',
///   leading: Icon(Icons.close),
///   backgroundColor: Colors.white,
/// );
///
/// // Secondary App Bar with a back button and default background
/// CustomAppBar.secondary(
///   title: 'Settings',
///   onBackPressed: () {
///     // Handle back button press
///   },
/// );
/// ```
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar.primary({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
    this.backgroundColor = AppColors.info500,
  }) : isPrimary = true;

  const CustomAppBar.secondary({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
    this.backgroundColor = AppColors.backgroundWhite,
  }) : isPrimary = false;

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final void Function()? onBackPressed;
  final Color? backgroundColor;
  final bool isPrimary;

  bool _isHasBackButton(BuildContext context) =>
      automaticallyImplyLeading && Navigator.canPop(context);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap.w16,
          if (leading != null) ...[
            leading!,
            Gap.w16,
          ] else if (_isHasBackButton(context)) ...[
            CustomIconButton.type(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              type: isPrimary
                  ? CustomIconButtonType.close
                  : CustomIconButtonType.back,
              isLightColor: isPrimary,
            ),
            Gap.w16,
          ],
          Expanded(
            child: Text(
              title,
              style: AppTypography.h5.toColor(
                isPrimary ? AppColors.textWhite : AppColors.textDark,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (actions != null) ...[
            Gap.w16,
            ...actions!,
          ],
          Gap.w16,
        ],
      ),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      bottom: isPrimary
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: AppColors.strokeTertiary,
                height: 1,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        isPrimary ? kToolbarHeight : kToolbarHeight + 1,
      );
}
