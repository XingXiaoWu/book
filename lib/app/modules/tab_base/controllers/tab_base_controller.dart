import 'package:get/get.dart';

class TabBaseController extends GetxController {
  //TODO: Implement TabBaseController

  final count = 0.obs;
  final tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print('onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('onReady');
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void changeTabIndex(temp) {
    tabIndex.value = temp;
    // update(['tab']);
  }
}
