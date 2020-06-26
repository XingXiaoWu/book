import 'package:book/pages/splash_page.dart';
import 'package:flutter/material.dart';

class RouterName{
  const RouterName._();
  // 引导页
  static const SplashPageName = "/splashpage";

  static Map<String, WidgetBuilder> routerMapss = {
     SplashPageName:(ctx) => SplashPage(),
  };
}