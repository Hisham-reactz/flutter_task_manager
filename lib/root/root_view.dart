import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key, required this.page}) : super(key: key);
  final Widget page;

  // This widget makes the app responsive.
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
        ScreenUtilInit(
            designSize: const Size(618.5, 1337.9), builder: () => page),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: const Color(0xffF2F5FF)));
  }
}
