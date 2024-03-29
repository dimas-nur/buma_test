import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/custom_button.dart';
import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../leave.gm.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: AppColors.strokeTertiary,
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: CustomButton.primary(
            onPressed: () => context.router.push(
              const LeaveRequestRoute(),
            ),
            isStretched: true,
            text: 'Buat Form Leave',
          ),
        ),
      ],
    );
  }
}
