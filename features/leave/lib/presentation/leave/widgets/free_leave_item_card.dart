import 'package:components/components.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/leave_entity.dart';

class FreeLeaveItemCard extends StatelessWidget {
  const FreeLeaveItemCard(
    this.leave, {
    super.key,
  });

  final LeaveEntity leave;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: () {},
      backgroundColor: AppColors.primary100,
      borderColor: AppColors.strokeSuccess,
      borderRadius: BorderRadius.circular(10.r),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: Assets.illustrations.waveLeaveFree.svg(
              fit: BoxFit.cover,
            ),
          ),
          CustomColumn(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icons.calendarAddBoldDuotone.svg(
                    height: 32.r,
                    width: 32.r,
                    // ignore: deprecated_member_use
                    color: AppColors.primary500,
                  ),
                  Gap.w8,
                  Expanded(
                    child: Text(
                      leave.type.name,
                      style: AppTypography.body.bold.colorDark,
                    ),
                  ),
                ],
              ),
              Gap.h8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Mulai',
                      style: AppTypography.body,
                      children: [
                        WidgetSpan(
                          child: Gap.w4,
                        ),
                        TextSpan(
                          text: leave.startDate
                              .dateTextFormat(isCompactMonth: true),
                          style: AppTypography.body.bold.colorDark,
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap.h4,
                  Text.rich(
                    TextSpan(
                      text: 'Berakhir',
                      style: AppTypography.body,
                      children: [
                        WidgetSpan(
                          child: Gap.w4,
                        ),
                        TextSpan(
                          text: leave.endDate
                                  ?.dateTextFormat(isCompactMonth: true) ??
                              '-',
                          style: AppTypography.body.bold.colorDark,
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
