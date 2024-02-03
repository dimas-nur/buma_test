import 'package:core/resources/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [INFO]
///
/// Constant for gaps to be used in the app with respecting 8 pixel rules
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
  static SizedBox width(double value) => SizedBox(width: value.w);
  static SizedBox height(double value) => SizedBox(height: value.h);
}
