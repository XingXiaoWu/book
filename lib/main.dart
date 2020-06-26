import 'dart:io';
import 'package:book/routers/router_name.dart';
import 'package:book/widgets/no_scale_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:book/constants/instances.dart';
import 'package:book/providers/providers.dart';
import 'package:book/providers/themes_provider.dart';
import 'package:book/widgets/no_glow_scrollbehavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:book/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'pages/splash_page.dart';
import 'providers/settings_provider.dart';
import 'constants/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  Brightness get _platformBrightness =>
      Screens.mediaQuery.platformBrightness ?? Brightness.light;

  @override
  void initState() {
    super.initState();
    trueDebugPrint("当前平台:${Platform.operatingSystem}");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer2<ThemesProvider, SettingsProvider>(builder: (
        BuildContext _,
        ThemesProvider themesProvider,
        SettingsProvider settingsProvider,
        Widget __,
      ) {
        //接收数据
        final isDark = themesProvider.platformBrightness
            ? _platformBrightness == Brightness.dark
            : themesProvider.dark;

        final theme =
            (isDark ? themesProvider.darkTheme : themesProvider.lightTheme)
                .copyWith(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        );
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value:
                isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
            child: Theme(
                data: theme,
                child: OKToast(
                    child: MaterialApp(
                  navigatorKey: Instances.navigatorKey,
                  builder: (BuildContext context, Widget widget) {
                    ScreenUtil.init(allowFontScaling: true);
                    return ScrollConfiguration(
                        behavior: const NoGlowScrollBehavior(),
                        child: NoScaleTextWidget(child: widget));
                    // ScreenUtil.init();
                  },
                  title: 'Books',
                  theme: theme,
                  // routers,没有参数的在这
                  // routes: {
                  //   RouterName.SplashPageName:(ctx) => SplashPage(),
                  // },
                  initialRoute: RouterName.SplashPageName,
                  routes: RouterName.routerMapss,
                  // 当我们通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，那么就会执行onGenerateRoute钩子函数；
                  // 我们可以在该函数中，手动创建对应的Route进行返回；
                  // 该函数有一个参数RouteSettings，该类有两个常用的属性：
                  // name: 跳转的路径名称
                  // arguments：跳转时携带的参数
                  onGenerateRoute: (RouteSettings setting){
                    return null;
                  },
                ))));
      }),
    );
  }
}
