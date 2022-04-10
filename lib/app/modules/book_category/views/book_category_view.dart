import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_category_controller.dart';

class BookCategoryView extends GetView<BookCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookCategoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
