import 'package:get/get.dart';

import 'logic.dart';

class BookSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookSourceLogic());
  }
}
