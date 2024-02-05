import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/leave_entity.dart';
import 'widgets.dart';

class MainLeaveItemSection extends StatelessWidget {
  const MainLeaveItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      child: CustomRow(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: LeaveItemCard(dummyUserLeaves[0]),
                ),
                Gap.h16,
                OtherLeaveItemCard(
                  dummyUserLeaves[2],
                  isDynamicHeight: true,
                ),
              ],
            ),
          ),
          Gap.w16,
          Expanded(
            child: Column(
              children: [
                FreeLeaveItemCard(dummyUserLeaves[1]),
                Gap.h16,
                Expanded(
                  child: AnnualLeaveItemCard(dummyUserLeaves[3]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
