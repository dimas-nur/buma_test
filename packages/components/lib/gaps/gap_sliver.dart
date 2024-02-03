import 'package:core/resources/app_sizes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [INFO]
///
/// Constant for gaps to be used in the app with respecting 8 pixel rules
class GapSliver {
  /// [INFO]
  ///
  /// Gaps that related with width
  static final w4 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w4));
  static final w8 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w8));
  static final w12 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w12));
  static final w16 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w16));
  static final w20 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w20));
  static final w24 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w24));
  static final w28 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w28));
  static final w32 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w32));
  static final w36 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w36));
  static final w40 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w40));
  static final w48 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w48));
  static final w52 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w52));
  static final w56 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w56));
  static final w64 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w64));
  static final w72 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w72));
  static final w80 = SliverToBoxAdapter(child: SizedBox(width: AppSizes.w80));

  /// [INFO]
  ///
  /// Gaps that related with height
  static final h4 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h4));
  static final h8 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h8));
  static final h12 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h12));
  static final h16 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h16));
  static final h20 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h20));
  static final h24 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h24));
  static final h28 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h28));
  static final h32 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h32));
  static final h36 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h36));
  static final h40 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h40));
  static final h48 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h48));
  static final h52 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h52));
  static final h56 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h56));
  static final h64 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h64));
  static final h72 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h72));
  static final h80 = SliverToBoxAdapter(child: SizedBox(height: AppSizes.h80));

  /// [INFO]
  ///
  /// Gaps for custom width or height outside the 8 pixel rules
  static SliverToBoxAdapter width(double value) =>
      SliverToBoxAdapter(child: SizedBox(width: value.w));
  static SliverToBoxAdapter height(double value) =>
      SliverToBoxAdapter(child: SizedBox(height: value.h));
}
