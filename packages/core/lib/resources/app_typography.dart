import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  /// Sub Heading/Large - H5
  static TextStyle h5 = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: AppColors.textWhite,
  );

  /// Body Formatting/Small
  static TextStyle bodySmall = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    color: AppColors.textWhite,
  );

  /// Body Formatting/Xtra Small
  static TextStyle bodyXSmall = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.textWhite,
  );
}
