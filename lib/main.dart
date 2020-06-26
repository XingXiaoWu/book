import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:book/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';
import 'package:book/constants/instances.dart';
import 'package:book/constants/screens.dart';
import 'package:book/utils/utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:book/constants/events.dart';

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
    // if (Platform.isAndroid &&
    //       DeviceUtils.deviceModel.toLowerCase().contains('oneplus')) {
    //     FlutterDisplayMode.setDeviceDefault();
    //   }
    // addPostFrameCallback 是 StatefulWidge 渲染结束的回调，
    // 只会被调用一次，之后 StatefulWidget 需要刷新 UI 也不会被调用，
    // addPostFrameCallback 的使用方法是在 initState 里添加回调：
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Connectivity().checkConnectivity().then(connectivityHandler);
    });
    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(connectivityHandler);
  }

  void connectivityHandler(ConnectivityResult result) {
    checkIfNoConnectivity(result);
    Instances.eventBus.fire(ConnectivityChangeEvent(result));
    Instances.connectivityResult = result;
    trueDebugPrint('Current connectivity: $result');
  }

  void checkIfNoConnectivity(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      connectivityToastFuture ??= showNoConnectivityDialog;
    } else {
      connectivityToastFuture?.dismiss(showAnim: true);
      if (connectivityToastFuture != null) {
        connectivityToastFuture = null;
      }
    }
  }

  ToastFuture get showNoConnectivityDialog => showToastWidget(
        noConnectivityWidget,
        duration: 999.weeks,
        handleTouch: true,
      );


  Widget get noConnectivityWidget => Material(
        color: Colors.black26,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Center(
            child: Container(
              width: Screens.width / 2,
              height: Screens.width / 2,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.router,
                    size: Screens.width / 6,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(height: Screens.width / 20),
                  Text(
                    '检查网络连接',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers);
  }
}
