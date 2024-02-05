import 'package:components/gaps/gap.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wrappers/custom_flex.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: 8.h,
            left: 16.w,
            right: 16.w,
            bottom: 64.h,
          ),
      child: CustomColumn(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24.w,
            height: 4.h,
            decoration: ShapeDecoration(
              color: AppColors.iconLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          Gap.h16,
          child,
        ],
      ),
    );
  }
}
