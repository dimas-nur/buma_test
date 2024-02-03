import 'package:components/components.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({
    super.key,
  });

  static final _transactionMenu = [
    MenuItemEntity(
      title: 'Probation',
      iconPath: Assets.icons.observation.path,
      onTap: () {},
    ),
    MenuItemEntity(
      title: 'Leave',
      iconPath: Assets.icons.leave.path,
      onTap: () {},
    ),
    MenuItemEntity(
      title: 'Dinas',
      iconPath: Assets.icons.travel.path,
      onTap: () {},
    ),
    MenuItemEntity(
      title: 'Izin',
      iconPath: Assets.icons.form.path,
      onTap: () {},
    ),
    MenuItemEntity(
      title: 'Lembur',
      iconPath: Assets.icons.document.path,
      onTap: () {},
    ),
    MenuItemEntity(
      title: 'Service Center',
      iconPath: Assets.icons.question.path,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction',
          style: AppTypography.h8,
        ),
        Gap.h16,
        StaggeredGrid.extent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 8.r,
          crossAxisSpacing: 8.r,
          children: _transactionMenu.map(
            (menu) {
              return MenuItem.vertical(
                menu,
                isBordered: false,
                isStaggered: true,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
