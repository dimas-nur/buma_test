import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.size,
    this.strokeWidth = 2,
    this.color = AppColors.iconDark,
  }) : isSliver = false;

  const CustomProgressIndicator.sliver({
    super.key,
    this.size,
    this.strokeWidth = 2,
    this.color,
  }) : isSliver = true;

  final double? size;
  final double strokeWidth;
  final Color? color;
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(
            child: _child(),
          )
        : _child();
  }

  Widget _child() {
    return SizedBox(
      width: size ?? 24.r,
      height: size ?? 24.r,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
        valueColor:
            color != null ? AlwaysStoppedAnimation<Color>(color!) : null,
      ),
    );
  }
}
