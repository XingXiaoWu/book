import 'dart:async';
import 'dart:io';
import 'package:book/constants/screens.dart';
import 'package:book/utils/device_utils.dart';
import 'package:book/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));
  runApp(BookApp());
  // runApp(MyApp());
}

class BookApp extends StatefulWidget {
  @override
  _BookAppState createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
  // 订阅流
  StreamSubscription connectivitySubscription;

  int initAction;

// 亮度
  Brightness get _platformBrightness => Screens.mediaQuery.platformBrightness ?? Brightness.light;

// 
  ToastFuture connectivityToastFuture;

  @override
  void initState() { 
    super.initState();
    trueDebugPrint("当前平台:${Platform.operatingSystem}");
    /// WidgetsBinding.instance.addObserver(this);
    /// 在一加手机上设置默认显示模式以适配90/120赫兹显示

    // if(Platform.isAndroid && DeviceUtils){

    // }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

}
