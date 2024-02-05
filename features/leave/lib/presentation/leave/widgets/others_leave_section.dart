import 'package:components/gaps/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave/domain/entities/leave_entity.dart';

import 'other_leave_item_card.dart';

class OtherLeaveItemSection extends StatelessWidget {
  const OtherLeaveItemSection({
    super.key,
  });

  static final _leaves =
      dummyUserLeaves.where((e) => e.type.isOtherCategory).toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          final leave = _leaves[index];
          final itemWidth = (1.sw - 48.w - (_leaves.length > 2 ? 36.w : 0)) / 2;

          return SizedBox(
            width: itemWidth,
            child: OtherLeaveItemCard(leave),
          );
        },
        itemCount: _leaves.length,
        separatorBuilder: (_, __) => Gap.w16,
      ),
    );
  }
}
