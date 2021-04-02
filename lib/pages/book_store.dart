///
///Author: Xing.Wu
///Date: 2021-04-02 10:57:14
///LastEditTime: 2021-04-02 14:19:57
///LastEditors: Xing.wu
///Description: 书城页面
///我是阿星，祝你幸福
///
import 'package:flutter/material.dart';
import 'package:flutter_book/app/app_color.dart';

class BookStore extends StatefulWidget {
  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书城"),
        leading: Center(
          child: Text("左边"),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                labelColor: AppColor.darkGray,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: AppColor.gray,
                indicatorColor: AppColor.secondary,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                tabs: [
                  Tab(text: '精选'),
                  Tab(text: '女生'),
                  Tab(text: '男生'),
                  Tab(text: '漫画'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
