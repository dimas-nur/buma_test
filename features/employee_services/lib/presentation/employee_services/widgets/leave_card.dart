import 'package:components/components.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: () {},
      margin: EdgeInsets.symmetric(
        horizontal: 16.h,
      ),
      splashColor: AppColors.info500,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _LeaveCardItem(
                  title: 'Cuti Tahunan',
                  daysDuration: 3,
                  endDate: DateTime(2024, 3, 24),
                ),
              ),
              Gap.w8,
              PrimaryDivider.vertical(
                height: 56.h,
                borderWidth: 2.w,
                isTransparency: true,
              ),
              Gap.w8,
              const Expanded(
                child: _LeaveCardItem(
                  title: 'Tahunan Diperpanjang',
                ),
              ),
            ],
          ),
          Gap.h8,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _carouselIndicator(isActive: true),
              Gap.w2,
              _carouselIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _carouselIndicator({bool isActive = false}) {
    return Container(
      width: isActive ? 8.r : 4.r,
      height: 4.r,
      decoration: ShapeDecoration(
        color: isActive ? AppColors.iconLightDark : AppColors.iconLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}

class _LeaveCardItem extends StatelessWidget {
  const _LeaveCardItem({
    required this.title,
    this.daysDuration = 0,
    this.endDate,
  });

  final String title;
  final int daysDuration;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTypography.bodySmall.colorLightDark,
          textAlign: TextAlign.center,
        ),
        Gap.h4,
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16.r,
              height: 16.r,
              padding: EdgeInsets.all(4.r),
              decoration: ShapeDecoration(
                color: AppColors.info500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Assets.icons.calendarMonth.svg(
                width: 8.r,
                height: 8.r,
                // fit: BoxFit.contain,
              ),
            ),
            Gap.w4,
            Flexible(
              child: Text(
                '$daysDuration Days',
                style: AppTypography.h5,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Gap.h4,
        Text(
          endDate != null
              ? 'Ended on ${DateFormat('MMM d, yyyy').format(endDate!)}'
              : '-',
          style: AppTypography.bodySmall.colorLightDark,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
