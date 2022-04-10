import 'package:book/app/modules/book_shelf/controllers/book_shelf_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SwitchView extends GetView<BookShelfController> {
  final double width = 160;
  final double height = 30;

  final BookShelfController ctrl =
      Get.put<BookShelfController>(BookShelfController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: 1,
            color: Colors.white,
            style: BorderStyle.solid,
          )),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              (() => Container(
                  padding: EdgeInsets.zero,
                  child: createButton('漫画', 0),
                  decoration: createBoxDecoration(0))),
            ),
          ),
          Expanded(
            child: Obx(
              (() => Container(
                  child: createButton('小说', 1),
                  decoration: createBoxDecoration(1))),
            ),
          ),
        ],
      ),
    );
  }

  TextButton createButton(String text, int clickIndex) {
    return TextButton(
      onPressed: () {
        ctrl.changeTopTabIndex(clickIndex);
      },
      child: Text(
        text,
        style: TextStyle(
            color: ctrl.topTabIndex.value == clickIndex
                ? Colors.blue
                : Colors.white),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
    );
  }

  BoxDecoration createBoxDecoration(int clickIndex) {
    return BoxDecoration(
        color:
            ctrl.topTabIndex.value == clickIndex ? Colors.white : Colors.blue);
  }
}
