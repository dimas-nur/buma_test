import 'package:components/wrappers/custom_inkwell.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({
    super.key,
    this.onTap,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = AppColors.backgroundWhite,
    this.isWithBorder = true,
    this.borderColor = AppColors.strokeTertiary,
    this.borderWidth = 1,
    this.splashColor = AppColors.info500,
  }) : isRippleOnTop = false;

  const PrimaryCard.topRipple({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = AppColors.backgroundWhite,
    this.isWithBorder = true,
    this.borderColor = AppColors.strokeTertiary,
    this.borderWidth = 1,
    this.splashColor = AppColors.info500,
  }) : isRippleOnTop = true;

  final void Function()? onTap;
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final bool isWithBorder;
  final Color borderColor;
  final double borderWidth;
  final Color splashColor;
  final bool isRippleOnTop;

  EdgeInsetsGeometry get _padding => padding ?? EdgeInsets.all(16.r);
  BorderRadius get _borderRadius => borderRadius ?? BorderRadius.circular(10.r);
  bool get _isWithBorder => isWithBorder && borderWidth != 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: (_borderRadius).add(
          BorderRadius.all(
            Radius.circular(
              _isWithBorder ? 2 : 0,
            ),
          ),
        ),
        border: _isWithBorder
            ? Border.all(
                color: borderColor,
                width: borderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              )
            : null,
      ),
      child: isRippleOnTop
          ? _body()
          : CustomInkWell(
              onTap: onTap,
              splashColor: splashColor,
              borderRadius: _borderRadius,
              child: _body(),
            ),
    );
  }

  Widget _body() {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Stack(
        children: [
          Padding(
            padding: _padding,
            child: child,
          ),
          if (onTap != null)
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: CustomInkWell(
                onTap: onTap,
                splashColor: splashColor,
              ),
            ),
        ],
      ),
    );
  }
}
