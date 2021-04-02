///
///Author: Xing.Wu
///Date: 2021-04-01 17:26:52
///LastEditTime: 2021-04-02 13:53:08
///LastEditors: Xing.wu
///Description:
///我是阿星，祝你幸福
///
import 'package:flutter/material.dart';
import 'package:flutter_book/pages/book_shelf.dart';
import 'package:flutter_book/pages/book_store.dart';

class LayoutMain extends StatefulWidget {
  @override
  _LayoutMainState createState() => _LayoutMainState();
}

class _LayoutMainState extends State<LayoutMain> {
  int _tabIndex = 1;
  // 是否完成设置
  bool finishSetup = false;

  List<Image> _tabImages = [
    Image.asset('img/tab_bookshelf_n.png'),
    Image.asset('img/tab_bookstore_n.png'),
    Image.asset('img/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/tab_bookshelf_p.png'),
    Image.asset('img/tab_bookstore_p.png'),
    Image.asset('img/tab_me_p.png'),
  ];

  //三个底部
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          BookShelf(),
          BookStore(),
          Container(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), label: "书架"),
          BottomNavigationBarItem(icon: getTabIcon(1), label: "书城"),
          BottomNavigationBarItem(icon: getTabIcon(2), label: "我的"),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    }
    return _tabImages[index];
  }
}
