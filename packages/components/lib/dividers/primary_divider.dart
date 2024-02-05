import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDivider extends StatelessWidget {
  const PrimaryDivider.vertical({
    super.key,
    this.height,
    this.borderWidth = 1,
    this.isRounded = true,
    this.isTransparency = false,
  }) : width = borderWidth;

  const PrimaryDivider.horizontal({
    super.key,
    this.width,
    this.borderWidth = 1,
    this.isRounded = true,
    this.isTransparency = false,
  }) : height = borderWidth;

  final double? height;
  final double? width;
  final double borderWidth;
  final bool isRounded;
  final bool isTransparency;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? double.infinity,
      width: width?.w ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.strokeTertiary.withOpacity(isTransparency ? 0.5 : 1),
        borderRadius: isRounded ? BorderRadius.circular(borderWidth.r) : null,
      ),
    );
  }
}
