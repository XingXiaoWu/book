import 'dart:async';

import 'package:book/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time/time.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key key,
    // this.initAction
  }) : super(key: key);

  // final int initAction;
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   Timer _timer;
  @override
  void initState() {
    super.initState();
    // 初始化定时器
    // const timeout = 
    _timer = Timer(const Duration(seconds: 5), (){
      // 跳转到新的页面
      trueDebugPrint("执行一次");
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: 500.milliseconds,
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: Center(
                    child: Text(
                  "多读书,读好书",
                )),
              ),
            ),
            value: SystemUiOverlayStyle.dark),
        onWillPop: () async => false);
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    cancelTimer();
    super.dispose();
  }
}
