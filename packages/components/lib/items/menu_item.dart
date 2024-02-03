import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';

class MenuItemEntity {
  MenuItemEntity({
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  final String title;
  final String iconPath;
  final void Function()? onTap;
}

class MenuItem extends StatelessWidget {
  const MenuItem.horizontal(
    this.menu, {
    super.key,
    this.isBordered = true,
    this.isStaggered = false,
  }) : isHorizontal = true;

  const MenuItem.vertical(
    this.menu, {
    super.key,
    this.isBordered = true,
    this.isStaggered = false,
  }) : isHorizontal = false;

  final MenuItemEntity menu;
  final bool isHorizontal;
  final bool isBordered;
  final bool isStaggered;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: menu.onTap,
      padding: EdgeInsets.symmetric(
        horizontal: (isHorizontal ? 16.w : 0),
        vertical: (isHorizontal ? 16.h : 8.h),
      ),
      isWithBorder: isBordered,
      splashColor: AppColors.primary500,
      child: _child,
    );
  }

  Widget get _child {
    return isHorizontal
        ? _horizontalMenu
        : isStaggered
            ? Center(
                child: _verticalMenu,
              )
            : _verticalMenu;
  }

  Widget get _horizontalMenu {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgGenImage(menu.iconPath).svg(
          width: 24.w,
          height: 24.h,
        ),
        Gap.w16,
        Flexible(
          child: Container(
            constraints: BoxConstraints(minWidth: 0.3.sw - 32.w),
            child: Text(
              menu.title,
              style: AppTypography.h6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _verticalMenu {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgGenImage(menu.iconPath).svg(
          width: 24.w,
          height: 24.h,
        ),
        Gap.h4,
        Text(
          menu.title,
          style: AppTypography.bodySmall.colorLightDark,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
