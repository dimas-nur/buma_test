import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetHelper {
  static Future<void> showPrimaryBottomSheet(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
  }) =>
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          ),
        ),
        backgroundColor: backgroundColor,
        isScrollControlled: true,
        builder: builder,
      );
}
