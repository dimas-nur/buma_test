import 'package:components/banners/banner_flavor.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      child: BannerFlavor(
        color: FlavorConfig.instance.color,
        message: FlavorConfig.instance.name.toUpperCase(),
        isProduction: FlavorConfig.isProduction,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: FlavorConfig.instance.values.appName,
          theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('id'),
            Locale('en'),
          ],
          locale: const Locale('id'),
          routerConfig: _appRouter.config(),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: widget ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
