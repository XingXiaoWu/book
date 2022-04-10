import 'package:get/get.dart';

class BookShelfController extends GetxController {
  //TODO: Implement BookShelfController

  final count = 0.obs;

  final topTabIndex = 0.obs;

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

  void changeTopTabIndex(int payload) {
    topTabIndex.value = payload;
  }

  void increment() => count.value++;
}
