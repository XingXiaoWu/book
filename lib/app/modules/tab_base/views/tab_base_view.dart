import 'package:book/app/modules/book_category/views/book_category_view.dart';
import 'package:book/app/modules/book_mall/views/book_mall_view.dart';
import 'package:book/app/modules/book_shelf/views/book_shelf_view.dart';
import 'package:book/app/modules/my_self/views/my_self_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_base_controller.dart';

class TabBaseView extends GetView<TabBaseController> {
  final TabBaseController ctrl =
      Get.put<TabBaseController>(TabBaseController());

  final List<Image> _tabImages = [
    Image.asset('assets/img/tabs/tab_bookshelf_n.png'),
    Image.asset('assets/img/tabs/tab_bookstore_n.png'),
    Image.asset('assets/img/tabs/tab_writer_n.png'),
    Image.asset('assets/img/tabs/tab_me_n.png'),
  ];
  final List<Image> _tabSelectedImages = [
    Image.asset('assets/img/tabs/tab_bookshelf_p.png'),
    Image.asset('assets/img/tabs/tab_bookstore_p.png'),
    Image.asset('assets/img/tabs/tab_writer_p.png'),
    Image.asset('assets/img/tabs/tab_me_p.png'),
  ];

  final List bodyPageList = [
    BookShelfView(),
    BookMallView(),
    BookCategoryView(),
    MySelfView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => bodyPageList[ctrl.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Color(0xFF58b188),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), label: "书架"),
            BottomNavigationBarItem(icon: getTabIcon(1), label: "书城"),
            BottomNavigationBarItem(icon: getTabIcon(2), label: '分类'),
            BottomNavigationBarItem(icon: getTabIcon(3), label: "我的"),
          ],
          currentIndex: ctrl.tabIndex.value,
          onTap: (index) {
            ctrl.changeTabIndex(index);
          },
        ),
      ),
      // bottomNavigationBar: GetBuilder<TabBaseController>(
      //   id: 'tab',
      //   builder: (ctl) => BottomNavigationBar(
      //     selectedItemColor: Color(0xFF58b188),
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(icon: getTabIcon(0), label: "书架"),
      //       BottomNavigationBarItem(icon: getTabIcon(1), label: "书城"),
      //       BottomNavigationBarItem(icon: getTabIcon(2), label: "我的"),
      //       // BottomNavigationBarItem(icon: Icon(Icons.face), label: '分类'),
      //     ],
      //     currentIndex: ctl.tabIndex.value,
      //     onTap: (index) {
      //       ctl.changeTabIndex(index);
      //     },
      //   ),
      // ),
    );
  }

  Image getTabIcon(int index) {
    if (index == ctrl.tabIndex.value) {
      return _tabSelectedImages[index];
    }
    return _tabImages[index];
  }
}
