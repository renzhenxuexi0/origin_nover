import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:origin_novel/pages/book_source/binding.dart';
import 'package:origin_novel/pages/book_source/view.dart';
import 'package:origin_novel/pages/setting/view.dart';

import '../../pages/book_detail/binding.dart';
import '../../pages/book_detail/view.dart';
import '../../pages/book_read/binding.dart';
import '../../pages/book_read/view.dart';
import '../../pages/book_search/binding.dart';
import '../../pages/book_search/view.dart';
import '../../pages/home/binding.dart';
import '../../pages/home/view.dart';
import '../../pages/setting/binding.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.bookSource,
      page: () => BookSourcePage(),
      binding: BookSourceBinding(),
    ),
    GetPage(
      name: AppRoutes.bookSearch,
      page: () => BookSearchPage(),
      binding: BookSearchBinding(),
    ),
    GetPage(
      name: AppRoutes.bookDetail,
      page: () => BookDetailPage(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.bookRead,
      page: () => BookReadPage(),
      binding: BookReadBinding(),
    ),
  ];
}
