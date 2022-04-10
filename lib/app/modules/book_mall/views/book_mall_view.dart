import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_mall_controller.dart';

class BookMallView extends GetView<BookMallController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMallView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookMallView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
