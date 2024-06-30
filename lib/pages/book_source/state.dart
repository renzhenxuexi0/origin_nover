import 'package:flutter/cupertino.dart';

import '../../app/database/models/models.dart';

class BookSourceState {
  List<BookSource> bookSources = [
    const BookSource(
      id: 1,
      bookSourceName: 'bookSourceName1',
      bookSourceUrl: '',
    ),
  ];

  List<BookSource> showBookSources = [];

  late TextEditingController searchController;

  BookSourceState() {
    showBookSources = bookSources;
  }
}
