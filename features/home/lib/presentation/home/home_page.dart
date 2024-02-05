import 'package:auto_route/auto_route.dart';
import 'package:core/routes/routes.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushRoute(const LeaveRequestRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.pushRoute(const EmployeeServicesRoute());
          },
          child: const Text('Employee Services'),
        ),
      ),
    );
  }
}
