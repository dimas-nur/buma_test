import 'package:components/components.dart';
import 'package:core/extensions/date_time.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/leave_entity.dart';

class OtherLeaveItemCard extends StatelessWidget {
  const OtherLeaveItemCard(
    this.leave, {
    super.key,
    this.isDynamicHeight = false,
  });

  final LeaveEntity leave;
  final bool isDynamicHeight;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: () {},
      backgroundColor: AppColors.info100,
      borderColor: AppColors.strokeInfo,
      borderRadius: BorderRadius.circular(10.r),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: Assets.illustrations.waveLeaveOther.svg(
              fit: BoxFit.cover,
            ),
          ),
          CustomColumn(
            mainAxisSize: isDynamicHeight ? MainAxisSize.min : MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                leave.type.name,
                style: AppTypography.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Gap.h4,
              Flexible(
                child: Text(
                  leave.startDate.dateRangeTextFormat(leave.endDate),
                  style: AppTypography.h5,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
