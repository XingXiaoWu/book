import 'package:get/get.dart';

import '../controllers/tab_base_controller.dart';

class TabBaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBaseController>(
      () => TabBaseController(),
    );
  }
}
