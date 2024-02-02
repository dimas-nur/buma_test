import 'package:components/banner/flavor_banner.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BumaHrisApp extends StatelessWidget {
  const BumaHrisApp({super.key});

  static const Size _designSize = Size(393, 852);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: FlavorBanner(
        color: FlavorConfig.instance.color,
        message: FlavorConfig.instance.name.toUpperCase(),
        isProduction: FlavorConfig.isProduction,
        child: MaterialApp(
          title: FlavorConfig.instance.values.appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(title: FlavorConfig.instance.values.appName),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('BUMA - TECHNICAL TEST'),
      ),
    );
  }
}
