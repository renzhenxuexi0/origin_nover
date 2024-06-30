import 'package:get/get.dart';

import 'logic.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SettingLogic());
}
