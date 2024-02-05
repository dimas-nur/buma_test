import 'package:components/components.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType {
  info,
  success,
  error,
  confirmation;

  String get title => switch (this) {
        DialogType.info => 'Information',
        DialogType.success => 'Woohoo!',
        DialogType.error => 'Oops!',
        DialogType.confirmation => 'Confirmation',
      };

  String get illustrationPath => switch (this) {
        DialogType.info => Assets.illustrations.dialogInformation.path,
        DialogType.success => Assets.illustrations.dialogSuccess.path,
        DialogType.error => Assets.illustrations.dialogError.path,
        DialogType.confirmation => Assets.illustrations.dialogConfirmation.path,
      };
}

class CustomDialog extends StatelessWidget {
  const CustomDialog.info({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.info;

  const CustomDialog.success({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.success;

  const CustomDialog.error({
    super.key,
    required this.message,
    this.textActionPositive = 'Tutup',
    this.onPositiveTap,
    this.textActionNegative,
    this.onNegativeTap,
  }) : type = DialogType.error;

  const CustomDialog.confirmation({
    super.key,
    required this.message,
    this.textActionPositive = 'Lanjutkan',
    this.onPositiveTap,
    this.textActionNegative = 'Batalkan',
    this.onNegativeTap,
  }) : type = DialogType.confirmation;

  final DialogType type;
  final String message;
  final String textActionPositive;
  final VoidCallback? onPositiveTap;
  final String? textActionNegative;
  final VoidCallback? onNegativeTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.backgroundWhite,
      backgroundColor: AppColors.backgroundWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      insetPadding: EdgeInsets.symmetric(
        vertical: 48.h,
        horizontal: 48.w,
      ),
      child: CustomColumn(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgGenImage(type.illustrationPath).svg(
            width: 100.r,
            height: 100.r,
          ),
          Gap.h16,
          Text(
            type.title,
            style: AppTypography.h5,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Text(
            message,
            style: AppTypography.body.colorDark,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Row(
            children: [
              if (type == DialogType.confirmation) ...[
                Expanded(
                  child: CustomButton.secondary(
                    onPressed: onNegativeTap ?? () => Navigator.pop(context),
                    isStretched: true,
                    text: textActionNegative ?? 'Batal',
                  ),
                ),
                Gap.w16,
              ],
              Expanded(
                child: CustomButton.primary(
                  onPressed: onPositiveTap ?? () => Navigator.pop(context),
                  isStretched: true,
                  text: textActionPositive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
