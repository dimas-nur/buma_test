import 'package:auto_route/annotations.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Page'),
      ),
      body: Center(
        child: Text('Leave Page'),
      ),
    );
  }
}
