import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [INFO]
///
/// Constant for sizes to be used in the app with respecting 8 pixel rules
class AppSizes {
  AppSizes._();

  /// [INFO]
  ///
  /// Sizes that related with the smaller of width or height
  static final r2 = 2.0.r;
  static final r4 = 4.0.r;
  static final r8 = 8.0.r;
  static final r12 = 12.0.r;
  static final r16 = 16.0.r;
  static final r20 = 20.0.r;
  static final r24 = 24.0.r;
  static final r28 = 28.0.r;
  static final r32 = 32.0.r;
  static final r36 = 36.0.r;
  static final r40 = 40.0.r;
  static final r48 = 48.0.r;
  static final r52 = 52.0.r;
  static final r56 = 56.0.r;
  static final r64 = 64.0.r;
  static final r72 = 72.0.r;
  static final r80 = 80.0.r;
  static final r96 = 96.0.r;

  /// [INFO]
  ///
  /// Sizes that related with width
  static final w2 = 2.0.w;
  static final w4 = 4.0.w;
  static final w8 = 8.0.w;
  static final w12 = 12.0.w;
  static final w16 = 16.0.w;
  static final w20 = 20.0.w;
  static final w24 = 24.0.w;
  static final w28 = 28.0.w;
  static final w32 = 32.0.w;
  static final w36 = 36.0.w;
  static final w40 = 40.0.w;
  static final w48 = 48.0.w;
  static final w52 = 52.0.w;
  static final w56 = 56.0.w;
  static final w64 = 64.0.w;
  static final w72 = 72.0.w;
  static final w80 = 80.0.w;
  static final w96 = 96.0.w;

  /// [INFO]
  ///
  /// Sizes that related with height
  static final h4 = 4.0.h;
  static final h8 = 8.0.h;
  static final h12 = 12.0.h;
  static final h16 = 16.0.h;
  static final h20 = 20.0.h;
  static final h24 = 24.0.h;
  static final h28 = 28.0.h;
  static final h32 = 32.0.h;
  static final h36 = 36.0.h;
  static final h40 = 40.0.h;
  static final h48 = 48.0.h;
  static final h52 = 52.0.h;
  static final h56 = 56.0.h;
  static final h64 = 64.0.h;
  static final h72 = 72.0.h;
  static final h80 = 80.0.h;
  static final h96 = 96.0.h;

  /// [INFO]
  ///
  /// Sizes for custom width or height outside the 8 pixel rules
  static double customWidth(double value) => value.w;
  static double customHeight(double value) => value.h;

  static MediaQueryData mediaQueryData(BuildContext context) =>
      MediaQuery.of(context);

  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double blockSizeHorizontal(BuildContext context) =>
      screenWidth(context) / 100;
  static double blockSizeVertical(BuildContext context) =>
      screenHeight(context) / 100;

  static double _safeAreaHorizontal(BuildContext context) =>
      blockSizeHorizontal(context) * 10;
  static double _safeAreaVertical(BuildContext context) =>
      blockSizeVertical(context) * 10;

  static double safeBlockHorizontal(BuildContext context) =>
      (_safeAreaHorizontal(context) / 100) * 10;
  static double safeBlockVertical(BuildContext context) =>
      (_safeAreaVertical(context) / 100) * 10;

  static EdgeInsets viewInsets(BuildContext context) =>
      MediaQuery.viewInsetsOf(context);

  static double paddingTop(BuildContext context) =>
      MediaQuery.paddingOf(context).top;
  static double paddingBottom(BuildContext context) =>
      MediaQuery.paddingOf(context).bottom;

  /// Status bar height , Notch will be higher
  static double get statusBarHeight => ScreenUtil().statusBarHeight;

  /// Bottom safe zone distance, suitable for buttons with full screen
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  /// The ratio of actual width to UI design
  static double get scaleWidth => ScreenUtil().scaleWidth;

  /// The ratio of actual height to UI design
  static double get scaleHeight => ScreenUtil().scaleHeight;
}
