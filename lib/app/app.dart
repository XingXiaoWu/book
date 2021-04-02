import 'package:flutter/material.dart';
import 'package:flutter_book/app/app_color.dart';
import 'package:flutter_book/layouts/layout_main.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '💗小说',
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: AppColor.paper,
        textTheme: TextTheme(bodyText1: TextStyle(color: AppColor.darkGray)),
      ),
      home: LayoutMain(),
    );
  }
}
