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
}
