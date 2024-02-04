import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  /// Sub Heading/Large - H5
  static TextStyle h5 = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: AppColors.textDark,
  );

  /// Sub Heading/Medium - H6
  static TextStyle h6 = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.45,
    color: AppColors.textDark,
  );

  /// Sub Heading/Small - H8
  static TextStyle h8 = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: AppColors.textLightDark,
  );

  /// Body Formatting/Body
  static TextStyle body = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.33,
    color: AppColors.textLightDark,
  );

  /// Body Formatting/Small
  static TextStyle bodySmall = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    color: AppColors.textDark,
  );

  /// Body Formatting/Xtra Small
  static TextStyle bodyXSmall = TextStyle(
    inherit: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.textDark,
  );
}
