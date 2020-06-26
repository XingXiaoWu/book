import 'dart:async';
import 'dart:io';
import 'package:book/constants/hive_boxes.dart';
import 'package:book/constants/screens.dart';
import 'package:book/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 数据库初始化
  if (!kIsWeb) {
    // 非web
    final dir = await getApplicationDocumentsDirectory();
    // Hive.init(dir.path);
  }
  // 开启数据库
  // await HiveBoxes.openBoxes();
  // 初始化设备信息
  // await DeviceUtils.initDeviceInfo();
  // 初始化包
  // await PackageUtils.initPackageInfo();
  // 初始化网络配置
  // NetUtils.initConfig();
  // NotificationUtils.initSettings();

  // 设置旋转方向
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // 设置状态栏
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
  Brightness get _platformBrightness =>
      Screens.mediaQuery.platformBrightness ?? Brightness.light;

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
    return Container();
  }
}
