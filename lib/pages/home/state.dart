import '../../app/constants/assets.dart';
import '../../app/database/models/models.dart';

class HomeState {
  late dynamic zoomDrawerController;
  late List<BookInfo> myBooks;

  HomeState() {
    myBooks = [
      const BookInfo(
        id: 1,
        name: '万相之王',
        author: '天蚕土豆',
        cover: Assets.imageWxzw,
        bookSourceId: 1,
      ),
    ];
  }
}
