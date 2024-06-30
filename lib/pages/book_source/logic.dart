import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class BookSourceLogic extends GetxController {
  final BookSourceState state = BookSourceState();

  @override
  void onInit() {
    super.onInit();
    state.searchController = TextEditingController();
  }

  void onSearchChanged(String value) {
    state.showBookSources = state.bookSources
        .where((element) => element.bookSourceName.contains(value))
        .toList();
    update();
  }
}
