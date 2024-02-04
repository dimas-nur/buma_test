import 'package:auto_route/annotations.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar.secondary(
        title: 'Leave',
      ),
      body: Center(
        child: Text('Leave Page'),
      ),
    );
  }
}
