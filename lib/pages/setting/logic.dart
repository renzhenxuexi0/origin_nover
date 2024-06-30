import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  /// 切换主题
  void changeThemeMode(ThemeMode? themeMode) {
    if (themeMode == null) {
      if (state.themeMode == ThemeMode.system) {
        Get.isDarkMode
            ? themeMode = ThemeMode.light
            : state.themeMode = ThemeMode.dark;
      } else if (state.themeMode == ThemeMode.light) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    }
    state.themeMode = themeMode!;
    Get.changeThemeMode(state.themeMode);
    update();
  }

  String get themeModeText {
    switch (state.themeMode) {
      case ThemeMode.light:
        return '浅色';
      case ThemeMode.dark:
        return '深色';
      case ThemeMode.system:
        return '跟随系统';
    }
  }
}
