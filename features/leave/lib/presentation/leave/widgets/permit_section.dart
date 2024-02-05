import 'package:components/components.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermitSection extends StatelessWidget {
  const PermitSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: PrimaryCard(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Assets.icons.calendarAddBoldDuotone.svg(
                  height: 32.r,
                  width: 32.r,
                  // ignore: deprecated_member_use
                  color: AppColors.primary500,
                ),
                Gap.w8,
                Text(
                  'Izin',
                  style: AppTypography.body.bold.colorDark,
                ),
              ],
            ),
            Gap.h8,
            Text(
              '-',
              style: AppTypography.body.bold.colorDark,
            ),
          ],
        ),
      ),
    );
  }
}
