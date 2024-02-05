import 'package:components/components.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        CustomRow(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          children: [
            Expanded(
              child: CustomButton.secondary(
                onPressed: () {},
                isStretched: true,
                text: 'Batal',
              ),
            ),
            Gap.w16,
            Expanded(
              child: CustomButton.primary(
                onPressed: () {},
                isStretched: true,
                text: 'Tambahkan',
                prefixIconPath: Assets.icons.add.path,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
