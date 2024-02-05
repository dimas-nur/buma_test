import 'package:core/resources/app_sizes.dart';
import 'package:flutter/material.dart';

/// The `Gap` class provides a set of predefined constant-sized `SizedBox` widgets
/// to create consistent gaps between elements in the app. These gaps follow the 8-pixel grid rule,
/// ensuring uniform spacing and alignment throughout the user interface.
///
/// ## Usage
/// To use `Gap`, simply choose the desired gap size from the available constants and place it
/// between your widgets. These gaps help maintain a visually pleasing and well-organized layout.
///
/// Example:
/// ```dart
/// // Create a vertical gap of 16 pixels between two widgets
/// Column(
///   children: [
///     SomeWidget(),
///     Gap.h16,
///     AnotherWidget(),
///   ],
/// );
/// ```
///
/// ## Constants
/// - `w2`, `w4`, `w8`, `w12`, `w16`, `w20`, `w24`, `w28`, `w32`, `w36`, `w40`, `w48`, `w52`, `w56`, `w64`, `w72`, `w80`:
///   Constants for horizontal gaps with widths ranging from 2 to 80 pixels.
/// - `h2`, `h4`, `h8`, `h12`, `h16`, `h20`, `h24`, `h28`, `h32`, `h36`, `h40`, `h48`, `h52`, `h56`, `h64`, `h72`, `h80`:
///   Constants for vertical gaps with heights ranging from 2 to 80 pixels.
/// - `width(double value)`: Creates a custom-width gap with the specified value.
/// - `height(double value)`: Creates a custom-height gap with the specified value.
///
/// Example:
/// ```dart
/// // Create a custom-width gap with a width of 24 pixels
/// Row(
///   children: [
///     SomeWidget(),
///     Gap.width(24),
///     AnotherWidget(),
///   ],
/// );
/// ```
class Gap {
  /// [INFO]
  ///
  /// Gaps that related with width
  static final w2 = SizedBox(width: AppSizes.w2);
  static final w4 = SizedBox(width: AppSizes.w4);
  static final w8 = SizedBox(width: AppSizes.w8);
  static final w12 = SizedBox(width: AppSizes.w12);
  static final w16 = SizedBox(width: AppSizes.w16);
  static final w20 = SizedBox(width: AppSizes.w20);
  static final w24 = SizedBox(width: AppSizes.w24);
  static final w28 = SizedBox(width: AppSizes.w28);
  static final w32 = SizedBox(width: AppSizes.w32);
  static final w36 = SizedBox(width: AppSizes.w36);
  static final w40 = SizedBox(width: AppSizes.w40);
  static final w48 = SizedBox(width: AppSizes.w48);
  static final w52 = SizedBox(width: AppSizes.w52);
  static final w56 = SizedBox(width: AppSizes.w56);
  static final w64 = SizedBox(width: AppSizes.w64);
  static final w72 = SizedBox(width: AppSizes.w72);
  static final w80 = SizedBox(width: AppSizes.w80);

  /// [INFO]
  ///
  /// Gaps that related with height
  static final h2 = SizedBox(height: AppSizes.h2);
  static final h4 = SizedBox(height: AppSizes.h4);
  static final h8 = SizedBox(height: AppSizes.h8);
  static final h12 = SizedBox(height: AppSizes.h12);
  static final h16 = SizedBox(height: AppSizes.h16);
  static final h20 = SizedBox(height: AppSizes.h20);
  static final h24 = SizedBox(height: AppSizes.h24);
  static final h28 = SizedBox(height: AppSizes.h28);
  static final h32 = SizedBox(height: AppSizes.h32);
  static final h36 = SizedBox(height: AppSizes.h36);
  static final h40 = SizedBox(height: AppSizes.h40);
  static final h48 = SizedBox(height: AppSizes.h48);
  static final h52 = SizedBox(height: AppSizes.h52);
  static final h56 = SizedBox(height: AppSizes.h56);
  static final h64 = SizedBox(height: AppSizes.h64);
  static final h72 = SizedBox(height: AppSizes.h72);
  static final h80 = SizedBox(height: AppSizes.h80);

  /// [INFO]
  ///
  /// Gaps for custom width or height outside the 8 pixel rules
  static SizedBox width(double value) => SizedBox(width: value);
  static SizedBox height(double value) => SizedBox(height: value);
}
