import 'package:flutter/material.dart';
import 'package:book/constants/screens.dart';
class TabsPage extends StatefulWidget {
  // 初始化加载的页面索引
  final int initAction;
  // 初始化索引
  const TabsPage({
    Key key,
    this.initAction,
  }) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  // 设置底部导航
  static const List<String> tabsTitle = <String>[
    '书架',
    '书城',
    '我的',
  ];
  // 图标
  static const List<Icon> tabsIcon = <Icon>[
    Icon(Icons.book),
    Icon(Icons.book),
    Icon(Icons.book),
  ];

  // 导航栏高度
  static const double bottomBarHeight = 72.0;

  /// 顶部Tab的文字样式基类
  static TextStyle get _baseTabTextStyle => TextStyle(
        fontSize: 23.0.sp,
        textBaseline: TextBaseline.alphabetic,
      );

  /// 选中的Tab文字样式
  static TextStyle get tabSelectedTextStyle => _baseTabTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  /// 未选中的Tab文字样式
  static TextStyle get tabUnselectedTextStyle => _baseTabTextStyle.copyWith(
        fontWeight: FontWeight.w300,
      );

   /// Index for pages.
  /// 当前页面索引
  int _currentIndex;

  /// Icon size for bottom navigation bar's item.
  /// 底部导航的图标大小
  double get bottomBarIconSize => bottomBarHeight / 2.25;

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
