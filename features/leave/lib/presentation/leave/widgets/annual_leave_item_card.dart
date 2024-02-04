import 'package:components/components.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/leave_entity.dart';

class AnnualLeaveItemCard extends StatelessWidget {
  const AnnualLeaveItemCard(
    this.leave, {
    super.key,
  });

  final LeaveEntity leave;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: () {},
      backgroundColor: AppColors.info500,
      borderColor: AppColors.strokeInfo,
      borderRadius: BorderRadius.circular(10.r),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: Assets.illustrations.waveLeaveYearly.svg(
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
              Expanded(
                child: CustomColumn(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leave.type.name,
                      style: AppTypography.h6.colorWhite,
                      textAlign: TextAlign.center,
                    ),
                    Gap.h8,
                    Container(
                      width: 60.r,
                      height: 60.r,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                      ),
                      child: Center(
                        child: Assets.icons.suitcaseTagBoldDuotone.svg(
                          height: 26.r,
                          width: 26.r,
                          // ignore: deprecated_member_use
                          color: AppColors.iconWhite,
                        ),
                      ),
                    ),
                    Gap.h8,
                    Text(
                      '${leave.duration} Hari',
                      style: AppTypography.h3.colorWhite,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Gap.h8,
              Text(
                'Berakhir ${leave.endDate?.dateTextFormat(isCompactMonth: true) ?? '-'}',
                style: AppTypography.bodySmall.colorWhite,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
