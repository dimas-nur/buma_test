import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';

/// [Info]
///
/// Extension for get TextTheme from BuildContext
extension XTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  // ----- Material 3 ----- //

  /// Font Size : 57
  /// Color : Display (dark)
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Font Size : 45
  /// Color : Display (dark)
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Font Size : 36
  /// Color : Display (dark)
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Font Size : 32
  /// Color : Display (dark)
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Font Size : 28
  /// Color : Display (dark)
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Font Size : 24
  /// Color : Body (light)
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Font Size : 22
  /// Color : Body (light)
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Font Size : 16
  /// Color : Body (light)
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Font Size : 14
  /// Color : Body (light)
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Font Size : 16
  /// Color : Body (light)
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Font Size : 14
  /// Color : Body (light)
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Font Size : 12
  /// Color : Display (dark)
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Font Size : 14
  /// Color : Body (light)
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Font Size : 12
  /// Color : Body (light)
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Font Size : : 11
  /// Color : Body (light)
  TextStyle? get labelSmall => textTheme.labelSmall;

  // ----- Material 2 ----- //

  /// Font Size : 96
  TextStyle? get headline1 => textTheme.displayLarge;

  /// Font Size : 60
  TextStyle? get headline2 => textTheme.displayMedium;

  /// Font Size : 48
  TextStyle? get headline3 => textTheme.displaySmall;

  /// Font Size : 34
  TextStyle? get headline4 => textTheme.headlineMedium;

  /// Font Size : 24
  TextStyle? get headline5 => textTheme.headlineSmall;

  /// Font Size : 20
  TextStyle? get headline6 => textTheme.titleLarge;

  /// Font Size : 16
  TextStyle? get subtitle1 => textTheme.titleMedium;

  /// Font Size : 14
  TextStyle? get subtitle2 => textTheme.titleSmall;

  /// Font Size : 16
  TextStyle? get bodyText1 => textTheme.bodyLarge;

  /// Font Size : 14
  TextStyle? get bodyText2 => textTheme.bodyMedium;

  /// Font Size : 12
  TextStyle? get caption => textTheme.bodySmall;

  /// Font Size : 14
  TextStyle? get button => textTheme.labelLarge;

  /// Font Size : 10
  TextStyle? get overline => textTheme.labelSmall;
}

/// [Info]
///
/// Extension for styling Text
extension XTextStyle on TextStyle {
  /// Change size
  TextStyle toSize(double? fontSize) => copyWith(fontSize: fontSize);

  /// Change weight
  TextStyle toWeight(FontWeight? fontWeight) =>
      copyWith(fontWeight: fontWeight);

  /// Change color
  TextStyle toColor(Color? color) => copyWith(color: color);

  /// Change to color `Text/text-white`
  TextStyle get colorWhite => toColor(AppColors.textWhite);

  /// Change to color `Text/text-light`
  TextStyle get colorLight => toColor(AppColors.textLight);

  /// Change to color `Text/text-lightdark`
  TextStyle get colorLightDark => toColor(AppColors.textLightDark);

  /// Change to color `Text/text-dark`
  TextStyle get colorDark => toColor(AppColors.textDark);

  /// FontWeight.w100
  TextStyle get thin => toWeight(FontWeight.w100);

  /// FontWeight.w200
  TextStyle get extraLight => toWeight(FontWeight.w200);

  /// FontWeight.w300
  TextStyle get light => toWeight(FontWeight.w300);

  /// FontWeight.w400
  TextStyle get normal => toWeight(FontWeight.w400);

  /// FontWeight.w500
  TextStyle get medium => toWeight(FontWeight.w500);

  /// FontWeight.w600
  TextStyle get semiBold => toWeight(FontWeight.w600);

  /// FontWeight.w700
  TextStyle get bold => toWeight(FontWeight.w700);

  /// FontWeight.w800
  TextStyle get extraBold => toWeight(FontWeight.w800);

  /// FontWeight.w900
  TextStyle get extraBlack => toWeight(FontWeight.w900);
}
