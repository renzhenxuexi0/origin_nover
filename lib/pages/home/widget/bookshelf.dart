part of '../view.dart';

class Bookshelf extends StatelessWidget {
  const Bookshelf({super.key, required this.logic, required this.state});

  final HomeLogic logic;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.myBooks.length,
      itemBuilder: (context, index) {
        return BookItem(
          book: state.myBooks[index],
        );
      },
    );
  }
}

class BookItem extends StatelessWidget {
  final BookInfo book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.bookDetail, arguments: book);
          },
          child: Image.asset(
            book.cover ?? Assets.defaultIcon,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
        ),
        const Gap.hn(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.bookRead, arguments: book);
            },
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.name,
                    style: context.textTheme.titleMedium,
                  ),
                  const Gap.vb(),
                  Text(
                    '${book.author ?? '未知'}  ·  1章未读',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const Gap.vn(),
                  Text(
                    '1天前更新  ·  第123章 xxx',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
