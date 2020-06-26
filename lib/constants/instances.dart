import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;

BuildContext get currentContext => navigatorState.context;

class Instances {
  const Instances._();

  // static final Eve
    static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // 事件主线
  static final EventBus eventBus = EventBus();
  // 网络状态
  static ConnectivityResult connectivityResult;
}