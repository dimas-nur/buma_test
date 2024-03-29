import 'package:auto_route/annotations.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

@RoutePage()
class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar.secondary(
        title: 'Leave',
      ),
      body: CustomScrollView(
        slivers: [
          GapSliver.h16,
          CustomSliverBox(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: const InformationSection(),
          ),
          GapSliver.h16,
          const SliverToBoxAdapter(
            child: MainLeaveItemSection(),
          ),
          GapSliver.h16,
          const SliverToBoxAdapter(
            child: OtherLeaveItemSection(),
          ),
          GapSliver.h16,
          const SliverToBoxAdapter(
            child: PermitSection(),
          ),
          GapSliver.h16,
        ],
      ),
      bottomNavigationBar: const BottomActionBar(),
    );
  }
}
