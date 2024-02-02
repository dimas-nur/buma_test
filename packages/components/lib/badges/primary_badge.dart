import 'package:core/resources/app_colors.dart';
import 'package:core/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `PrimaryBadge` widget is used to display a badge on top of another widget,
/// indicating additional information such as a notification count or status.
///
/// ## Usage
/// To use `PrimaryBadge`, you can create an instance of the widget with different
/// types and sizes based on your requirements.
///
/// Example:
/// ```dart
/// PrimaryBadge.dot(
///   child: Icon(Icons.notifications),
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
///
/// Example with a label:
/// ```dart
/// PrimaryBadge.oneDigit(
///   child: Icon(Icons.mail),
///   label: '4',
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
///
/// Example with a label for a two-digit count:
/// ```dart
/// PrimaryBadge.twoDigit(
///   child: Icon(Icons.notifications),
///   label: '15',
///   size: PrimaryBadgeSize.large,
/// )
/// ```
///
/// Example with a label for more than two digits:
/// ```dart
/// PrimaryBadge.moreDigit(
///   child: Icon(Icons.mail),
///   label: '99+',
///   size: PrimaryBadgeSize.large,
/// )
/// ```
///
/// ## Parameters
/// - `child`: The widget to which the badge is applied.
/// - `type`: The type of badge, which determines the appearance.
/// - `size`: The size of the badge, adjusting the visual prominence.
/// - `label`: The label displayed inside the badge, typically representing a count.
///
/// The badge is created as a stack with the provided `child` widget and an
/// indicator based on the specified `type`. The indicator can be a simple dot
/// or a text label, depending on the `type`. The `size` parameter adjusts the
/// overall size of the badge, and the `label` parameter is used to display
/// a count or other textual information inside the badge.
///
/// Example:
/// ```dart
/// PrimaryBadge.oneDigit(
///   child: Icon(Icons.mail),
///   label: '4',
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
class PrimaryBadge extends StatelessWidget {
  /// Creates a dot indicator badge.
  const PrimaryBadge.dot({
    super.key,
    required this.child,
    this.size = PrimaryBadgeSize.medium,
  })  : type = PrimaryBadgeType.dot,
        label = null;

  /// Creates a badge with a one-digit count label.
  const PrimaryBadge.oneDigit({
    super.key,
    required this.child,
    required this.label,
    this.size = PrimaryBadgeSize.medium,
  }) : type = PrimaryBadgeType.oneDigit;

  /// Creates a badge with a two-digit count label.
  const PrimaryBadge.twoDigit({
    super.key,
    required this.child,
    required this.label,
    this.size = PrimaryBadgeSize.medium,
  }) : type = PrimaryBadgeType.twoDigit;

  /// Creates a badge with a label for more than two digits (99+).
  const PrimaryBadge.moreDigit({
    super.key,
    required this.child,
    required this.label,
    this.size = PrimaryBadgeSize.medium,
  }) : type = PrimaryBadgeType.moreDigit;

  final PrimaryBadgeType type;
  final PrimaryBadgeSize size;
  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (type == PrimaryBadgeType.dot) ...[
          Positioned(
            right: 4.r,
            top: 4.r,
            child: _dotIndicator(),
          ),
        ] else
          Positioned(
            right: 0,
            top: 0,
            child: _textIndicator(),
          ),
      ],
    );
  }

  Widget _dotIndicator() {
    return Container(
      height: size.size.r,
      width: size.size.r,
      decoration: BoxDecoration(
        color: AppColors.danger500,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.iconWhite,
          width: 1.r,
        ),
      ),
    );
  }

  Widget _textIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size == PrimaryBadgeSize.large ? 4.r : 0,
        horizontal: 4.r,
      ),
      decoration: BoxDecoration(
        color: AppColors.danger500,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: AppColors.iconWhite,
          width: 1.r,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        type == PrimaryBadgeType.dot
            ? ''
            : '${label?.substring(0, type.maxDigits)}${type == PrimaryBadgeType.moreDigit ? '+' : ''}',
        style: size == PrimaryBadgeSize.small
            ? AppTypography.bodyXSmall
            : AppTypography.bodySmall,
      ),
    );
  }
}

/// The `PrimaryBadgeType` enum defines different types of badges that can be
/// used with the `PrimaryBadge` widget. Each enum value represents a specific
/// type of badge, indicating the maximum number of digits that can be displayed
/// as a count inside the badge.
///
/// ## Usage
/// The `PrimaryBadgeType` enum is typically used when creating instances of the
/// `PrimaryBadge` widget to specify the type of badge to be displayed.
///
/// Example:
/// ```dart
/// PrimaryBadge.oneDigit(
///   child: Icon(Icons.notifications),
///   label: '4',
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
///
/// Enum Values:
/// - `dot`: Represents a badge with a dot indicator, indicating a notification
///   without displaying a specific count.
/// - `oneDigit`: Represents a badge with a one-digit count label.
/// - `twoDigit`: Represents a badge with a two-digit count label.
/// - `moreDigit`: Represents a badge with a label for more than two digits,
///   typically displaying '99+' for counts exceeding 99.
///
/// Example:
/// ```dart
/// PrimaryBadge.twoDigit(
///   child: Icon(Icons.notifications),
///   label: '15',
///   size: PrimaryBadgeSize.large,
/// )
/// ```
enum PrimaryBadgeType {
  /// Represents a badge with a dot indicator.
  dot._(0),

  /// Represents a badge with a one-digit count label.
  oneDigit._(1),

  /// Represents a badge with a two-digit count label.
  twoDigit._(2),

  /// Represents a badge with a label for more than two digits.
  moreDigit._(2);

  const PrimaryBadgeType._(this.maxDigits);

  final int maxDigits;
}

/// The `PrimaryBadgeSize` enum defines different sizes for badges that can be
/// used with the `PrimaryBadge` widget. Each enum value represents a specific
/// size for the badge, adjusting its visual prominence.
///
/// ## Usage
/// The `PrimaryBadgeSize` enum is typically used when creating instances of the
/// `PrimaryBadge` widget to specify the size of the badge to be displayed.
///
/// Example:
/// ```dart
/// PrimaryBadge.dot(
///   child: Icon(Icons.notifications),
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
///
/// Enum Values:
/// - `small`: Represents a small-sized badge.
/// - `medium`: Represents a medium-sized badge.
/// - `large`: Represents a large-sized badge.
///
/// Example:
/// ```dart
/// PrimaryBadge.oneDigit(
///   child: Icon(Icons.mail),
///   label: '4',
///   size: PrimaryBadgeSize.medium,
/// )
/// ```
enum PrimaryBadgeSize {
  /// Represents a small-sized badge.
  small._(4),

  /// Represents a medium-sized badge.
  medium._(8),

  /// Represents a large-sized badge.
  large._(16);

  const PrimaryBadgeSize._(this.size);

  final double size;
}
