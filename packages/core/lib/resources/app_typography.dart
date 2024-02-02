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
