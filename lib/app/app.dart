import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';

class VelmiqueBeautyApp extends StatelessWidget {
  const VelmiqueBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: MaterialApp.router(
        title: AppStrings.appName,
        theme: AppTheme.light,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
      breakpoints: [
        const Breakpoint(start: 0, end: 449, name: MOBILE),
        const Breakpoint(start: 450, end: 1199, name: TABLET),
        const Breakpoint(start: 1200, end: double.infinity, name: DESKTOP),
      ],
    );
  }
}
