import 'package:get/get.dart';

import '../modules/book_category/bindings/book_category_binding.dart';
import '../modules/book_category/views/book_category_view.dart';
import '../modules/book_mall/bindings/book_mall_binding.dart';
import '../modules/book_mall/views/book_mall_view.dart';
import '../modules/book_shelf/bindings/book_shelf_binding.dart';
import '../modules/book_shelf/views/book_shelf_view.dart';
import '../modules/my_self/bindings/my_self_binding.dart';
import '../modules/my_self/views/my_self_view.dart';
import '../modules/tab_base/bindings/tab_base_binding.dart';
import '../modules/tab_base/views/tab_base_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TAB_BASE;

  static final routes = [
    GetPage(
      name: _Paths.TAB_BASE,
      page: () => TabBaseView(),
      binding: TabBaseBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_SHELF,
      page: () => BookShelfView(),
      binding: BookShelfBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_MALL,
      page: () => BookMallView(),
      binding: BookMallBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_CATEGORY,
      page: () => BookCategoryView(),
      binding: BookCategoryBinding(),
    ),
    GetPage(
      name: _Paths.MY_SELF,
      page: () => MySelfView(),
      binding: MySelfBinding(),
    ),
  ];
}
