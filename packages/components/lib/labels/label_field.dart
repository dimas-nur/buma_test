import 'package:components/gaps/gap.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelField extends StatelessWidget {
  const LabelField({
    super.key,
    required this.label,
    this.required = false,
    this.iconPath,
  });

  final String label;
  final bool required;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.body.colorDark,
            ),
            if (required) ...[
              Gap.w4,
              Text(
                '*',
                style: AppTypography.body.toColor(
                  AppColors.danger500,
                ),
              ),
            ],
            if (iconPath != null) ...[
              Gap.w4,
              SvgGenImage(iconPath!).svg(
                width: 16.r,
                height: 16.r,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
