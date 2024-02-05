import 'package:components/components.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LeaveCard extends StatefulWidget {
  const LeaveCard({
    super.key,
  });

  @override
  State<LeaveCard> createState() => _LeaveCardState();
}

class _LeaveCardState extends State<LeaveCard> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.strokeTertiary,
          width: 1.w,
        ),
      ),
      child: CustomColumn(
        children: [
          SizedBox(
            height: 62.h,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1 / 2),
              onPageChanged: (index) {
                if (index != _activeIndex) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      _activeIndex = index;
                    });
                  });
                }
              },
              padEnds: false,
              itemBuilder: (context, index) {
                final data = dummyData[index];

                return Row(
                  children: [
                    if (index != 0)
                      PrimaryDivider.vertical(
                        height: 56.h,
                        borderWidth: 2.w,
                        isTransparency: true,
                      ),
                    Gap.w8,
                    SizedBox(
                      width: (1.sw - 70.w) / 2,
                      child: _LeaveCardItem(
                        title: data['title'] as String,
                        daysDuration: data['daysDuration'] as int,
                        endDate: data['endDate'] as DateTime?,
                      ),
                    ),
                    Gap.w8,
                  ],
                );
              },
              itemCount: dummyData.length,
            ),
          ),
          Gap.h8,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              dummyData.length - 1,
              (index) {
                return _carouselIndicator(
                  isActive: index == _activeIndex,
                  isLast: index == dummyData.length - 2,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _carouselIndicator({
    bool isActive = false,
    bool isLast = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 8.r : 4.r,
      height: 4.r,
      margin: EdgeInsets.only(right: isLast ? 0 : 2.r),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTypography.bodySmall.colorLightDark,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

final dummyData = [
  {
    'title': 'Cuti Tahunan',
    'daysDuration': 3,
    'endDate': DateTime(2024, 3, 24),
  },
  {
    'title': 'Tahunan Diperpanjang',
    'daysDuration': 0,
    'endDate': null,
  },
  {
    'title': 'Cuti Besar',
    'daysDuration': 4,
    'endDate': DateTime(2024, 4, 10),
  },
  {
    'title': 'Cuti Bersama Keluarga',
    'daysDuration': 2,
    'endDate': DateTime(2024, 4, 26),
  },
  {
    'title': 'Cuti Free',
    'daysDuration': 0,
    'endDate': null,
  },
];
