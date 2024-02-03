import 'package:components/components.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteMenuSection extends StatelessWidget {
  const FavoriteMenuSection({
    super.key,
  });

  static final _favoriteMenu = [
    MenuItemEntity(
      title: 'Leave',
      iconPath: Assets.icons.leave.path,
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
          'Favorite',
          style: AppTypography.h5,
        ),
        Gap.h16,
        StaggeredGrid.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16.r,
          crossAxisSpacing: 16.r,
          children: _favoriteMenu.map(
            (menu) {
              return MenuItem.horizontal(
                menu,
                isStaggered: true,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
