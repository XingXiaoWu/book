import 'package:book/app/widgets/views/switch_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_shelf_controller.dart';

enum FeatureList {
  trim,
  switchMode,
  sort,
  down,
}

class BookShelfView extends GetView<BookShelfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SwitchView(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              showMenu(
                  context: context,
                  // 左上右下
                  position: RelativeRect.fromLTRB(0.0, 76.0, 0.0, 0.0),
                  items: <PopupMenuItem<FeatureList>>[
                    const PopupMenuItem<FeatureList>(
                      child: Text('整理书架'),
                      value: FeatureList.trim,
                    ),
                    const PopupMenuItem<FeatureList>(
                      value: FeatureList.switchMode,
                      child: Text('切换模式'),
                    ),
                    const PopupMenuItem<FeatureList>(
                      value: FeatureList.sort,
                      child: Text('选择排序'),
                    ),
                    const PopupMenuItem<FeatureList>(
                      value: FeatureList.down,
                      child: Text('下载进度'),
                    ),
                  ]);
            },
            icon: Icon(Icons.face)),
        // leading: PopupMenuButton<FeatureList>(
        //   onSelected: (FeatureList result) {},
        //   icon: Icon(Icons.face),
        //   itemBuilder: (BuildContext context) => <PopupMenuEntry<FeatureList>>[
        //     const PopupMenuItem<FeatureList>(
        //       value: FeatureList.trim,
        //       child: Text('整理书架'),
        //     ),
        //     const PopupMenuItem<FeatureList>(
        //       value: FeatureList.switchMode,
        //       child: Text('切换模式'),
        //     ),
        //     const PopupMenuItem<FeatureList>(
        //       value: FeatureList.sort,
        //       child: Text('选择排序'),
        //     ),
        //     const PopupMenuItem<FeatureList>(
        //       value: FeatureList.down,
        //       child: Text('下载进度'),
        //     ),
        //   ],
        // ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: Text(
          'BookShelfView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
