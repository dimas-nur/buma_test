import 'package:components/components.dart';
import 'package:core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class EmployeeServicesAppBar extends StatefulWidget {
  const EmployeeServicesAppBar({
    super.key,
    required this.onBackPressed,
    required this.onSearchPressed,
    required this.onNotificationPressed,
    required this.backgroundAnimationController,
  });

  final void Function()? onBackPressed;
  final void Function()? onSearchPressed;
  final void Function()? onNotificationPressed;
  final AnimationController backgroundAnimationController;

  @override
  State<EmployeeServicesAppBar> createState() => _EmployeeServicesAppBarState();
}

class _EmployeeServicesAppBarState extends State<EmployeeServicesAppBar> {
  late Animation<double> _backgroundOpacityTween;

  @override
  void initState() {
    _backgroundOpacityTween = Tween<double>(begin: 0, end: 1)
        .animate(widget.backgroundAnimationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.backgroundAnimationController,
      builder: (context, _) {
        return PrimaryAppBar(
          title: 'Employee Services',
          leading: PrimaryIconButton.type(
            onPressed: widget.onBackPressed,
            type: PrimaryIconButtonType.close,
            isLightColor: true,
          ),
          actions: [
            PrimaryIconButton.type(
              onPressed: widget.onSearchPressed,
              type: PrimaryIconButtonType.search,
              isLightColor: true,
            ),
            Gap.w8,
            PrimaryBadge.dot(
              child: PrimaryIconButton.type(
                onPressed: widget.onNotificationPressed,
                type: PrimaryIconButtonType.notification,
                isLightColor: true,
              ),
            ),
          ],
          backgroundColor: AppColors.info500.withOpacity(
            _backgroundOpacityTween.value,
          ),
        );
      },
    );
  }
}
