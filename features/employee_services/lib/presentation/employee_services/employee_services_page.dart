import 'package:auto_route/auto_route.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

@RoutePage()
class EmployeeServicesPage extends StatefulWidget {
  const EmployeeServicesPage({super.key});

  @override
  State<EmployeeServicesPage> createState() => _EmployeeServicesPageState();
}

class _EmployeeServicesPageState extends State<EmployeeServicesPage>
    with TickerProviderStateMixin {
  late AnimationController _appBarAnimationController;

  bool scrollListener(ScrollNotification scrollInfo) {
    var scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _appBarAnimationController.animateTo(scrollInfo.metrics.pixels / 40);
      return scroll = true;
    }
    return scroll;
  }

  @override
  void initState() {
    _appBarAnimationController = AnimationController(
      vsync: this,
      duration: Duration.zero,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: NotificationListener<ScrollNotification>(
              onNotification: scrollListener,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Assets.images.imgEmpSrvBackground.svg(
                      width: 1.sw,
                      height: 206.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // TODO: Remove dummy list
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100.h,
                        color: index.isEven ? Colors.grey : Colors.white,
                      );
                    },
                    itemCount: 100,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: EmployeeServicesAppBar(
              onBackPressed: () => context.popRoute(),
              onSearchPressed: () {},
              onNotificationPressed: () {},
              backgroundAnimationController: _appBarAnimationController,
            ),
          ),
        ],
      ),
    );
  }
}
