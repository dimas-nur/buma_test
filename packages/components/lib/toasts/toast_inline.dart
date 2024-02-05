// ignore_for_file: deprecated_member_use

import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastInlineType {
  error,
  info,
  success,
  warning,
  neutral;

  Color get color => switch (this) {
        ToastInlineType.error => AppColors.danger500,
        ToastInlineType.info => AppColors.info500,
        ToastInlineType.success => AppColors.primary500,
        ToastInlineType.warning => AppColors.warning600,
        ToastInlineType.neutral => AppColors.textLightDark,
      };

  Color get backgroundColor => switch (this) {
        ToastInlineType.error => AppColors.danger100,
        ToastInlineType.info => AppColors.info100,
        ToastInlineType.success => AppColors.primary100,
        ToastInlineType.warning => AppColors.warning100,
        ToastInlineType.neutral => AppColors.backgroundLight,
      };

  Widget get iconPath => switch (this) {
        ToastInlineType.error => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.info => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.success => Assets.icons.checkCircle.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.warning => Assets.icons.warning.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
        ToastInlineType.neutral => Assets.icons.info.svg(
            color: color,
            width: 16.r,
            height: 16.r,
          ),
      };
}

class ToastInline extends StatelessWidget {
  const ToastInline.error({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.error;

  const ToastInline.info({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.info;

  const ToastInline.success({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.success;

  const ToastInline.warning({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.warning;

  const ToastInline.neutral({
    super.key,
    required this.message,
    this.isWithIcon = true,
  }) : type = ToastInlineType.neutral;

  final String message;
  final ToastInlineType type;
  final bool isWithIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 8.w,
      ),
      decoration: ShapeDecoration(
        color: type.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isWithIcon) ...[
            type.iconPath,
            SizedBox(width: 4.w),
          ],
          Expanded(
            child: Text(
              message,
              style: AppTypography.body.toColor(type.color),
            ),
          ),
        ],
      ),
    );
  }
}
