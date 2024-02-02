import 'package:components/banner/flavor_banner.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BumaHrisApp extends StatefulWidget {
  const BumaHrisApp({super.key});

  static const Size _designSize = Size(393, 852);

  @override
  State<BumaHrisApp> createState() => _BumaHrisAppState();
}

class _BumaHrisAppState extends State<BumaHrisApp> {
  final _appRouter = getIt<BumaHrisAppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: BumaHrisApp._designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: FlavorBanner(
        color: FlavorConfig.instance.color,
        message: FlavorConfig.instance.name.toUpperCase(),
        isProduction: FlavorConfig.isProduction,
        child: MaterialApp.router(
          title: FlavorConfig.instance.values.appName,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
