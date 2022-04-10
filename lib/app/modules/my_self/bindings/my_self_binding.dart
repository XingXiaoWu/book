import 'package:get/get.dart';

import '../controllers/my_self_controller.dart';

class MySelfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySelfController>(
      () => MySelfController(),
    );
  }
}
