import 'package:components/gaps/gap.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backgroundColor = AppColors.info500,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) ...[
            Gap.w16,
            leading!,
            Gap.w16,
          ],
          Expanded(
            child: Text(
              title,
              style: AppTypography.h5.colorWhite,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (actions != null) ...[
            Gap.w16,
            ...actions!,
            Gap.w16,
          ],
        ],
      ),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
    );
  }
}
