import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_self_controller.dart';

class MySelfView extends GetView<MySelfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySelfView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MySelfView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
