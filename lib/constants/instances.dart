import 'package:flutter/material.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;

BuildContext get currentContext => navigatorState.context;

class Instances {
  const Instances._();

  // static final Eve
    static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}