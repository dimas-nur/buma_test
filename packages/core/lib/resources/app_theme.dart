import 'package:core/resources/dummy_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTheme is a utility class that provides predefined light and dark themes
/// for a Flutter application. It utilizes a custom ColorScheme with colors
/// defined in the (AppColors / DummyColors) class.
class AppTheme {
  AppTheme._();

  /// Light Theme
  ///
  /// A ThemeData object representing the light theme with colors defined in
  /// the (AppColors / DummyColors) class.
  static ThemeData light = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: DummyColors.primaryLight,
      onPrimary: DummyColors.onPrimaryLight,
      primaryContainer: DummyColors.primaryContainerLight,
      onPrimaryContainer: DummyColors.onPrimaryContainerLight,
      secondary: DummyColors.secondaryLight,
      onSecondary: DummyColors.onSecondaryLight,
      secondaryContainer: DummyColors.secondaryContainerLight,
      onSecondaryContainer: DummyColors.onSecondaryContainerLight,
      tertiary: DummyColors.tertiaryLight,
      onTertiary: DummyColors.onTertiaryLight,
      tertiaryContainer: DummyColors.tertiaryContainerLight,
      onTertiaryContainer: DummyColors.onTertiaryContainerLight,
      error: DummyColors.errorLight,
      onError: DummyColors.onErrorLight,
      errorContainer: DummyColors.errorContainerLight,
      onErrorContainer: DummyColors.onErrorContainerLight,
      background: DummyColors.backgroundLight,
      onBackground: DummyColors.onBackgroundLight,
      surface: DummyColors.surfaceLight,
      onSurface: DummyColors.onSurfaceLight,
      surfaceVariant: DummyColors.surfaceVariantLight,
      onSurfaceVariant: DummyColors.onSurfaceVariantLight,
      outline: DummyColors.outlineLight,
      outlineVariant: DummyColors.outlineVariantLight,
      shadow: DummyColors.shadowLight,
      scrim: DummyColors.scrimLight,
      inverseSurface: DummyColors.inverseSurfaceLight,
      onInverseSurface: DummyColors.onInverseSurfaceLight,
      inversePrimary: DummyColors.inversePrimaryLight,
      surfaceTint: DummyColors.surfaceTintLight,
    ),
  );

  /// Dark Theme
  ///
  /// A ThemeData object representing the dark theme with colors defined in
  /// the (AppColors / DummyColors) class.
  static ThemeData dark = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: DummyColors.primaryDark,
      onPrimary: DummyColors.onPrimaryDark,
      primaryContainer: DummyColors.primaryContainerDark,
      onPrimaryContainer: DummyColors.onPrimaryContainerDark,
      secondary: DummyColors.secondaryDark,
      onSecondary: DummyColors.onSecondaryDark,
      secondaryContainer: DummyColors.secondaryContainerDark,
      onSecondaryContainer: DummyColors.onSecondaryContainerDark,
      tertiary: DummyColors.tertiaryDark,
      onTertiary: DummyColors.onTertiaryDark,
      tertiaryContainer: DummyColors.tertiaryContainerDark,
      onTertiaryContainer: DummyColors.onTertiaryContainerDark,
      error: DummyColors.errorDark,
      onError: DummyColors.onErrorDark,
      errorContainer: DummyColors.errorContainerDark,
      onErrorContainer: DummyColors.onErrorContainerDark,
      background: DummyColors.backgroundDark,
      onBackground: DummyColors.onBackgroundDark,
      surface: DummyColors.surfaceDark,
      onSurface: DummyColors.onSurfaceDark,
      surfaceVariant: DummyColors.surfaceVariantDark,
      onSurfaceVariant: DummyColors.onSurfaceVariantDark,
      outline: DummyColors.outlineDark,
      outlineVariant: DummyColors.outlineVariantDark,
      shadow: DummyColors.shadowDark,
      scrim: DummyColors.scrimDark,
      inverseSurface: DummyColors.inverseSurfaceDark,
      onInverseSurface: DummyColors.onInverseSurfaceDark,
      inversePrimary: DummyColors.inversePrimaryDark,
      surfaceTint: DummyColors.surfaceTintDark,
    ),
  );
}
