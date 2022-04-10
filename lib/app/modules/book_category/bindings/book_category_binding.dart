import 'package:get/get.dart';

import '../controllers/book_category_controller.dart';

class BookCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookCategoryController>(
      () => BookCategoryController(),
    );
  }
}
