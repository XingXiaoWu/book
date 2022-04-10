import 'package:get/get.dart';

import '../controllers/book_mall_controller.dart';

class BookMallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookMallController>(
      () => BookMallController(),
    );
  }
}
