part of '../view.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          text: '搜索',
          icon: Icons.search,
          onPressed: () {
            Get.toNamed(AppRoutes.bookSearch);
          },
        ),
        MenuItem(
          text: '书源管理',
          icon: Icons.book,
          onPressed: () {
            Get.toNamed(AppRoutes.bookSource);
          },
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const MenuItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Icon(icon),
                const Gap.hn(),
                Text(text),
              ],
            ),
          ),
          const Divider(),
          const Gap.vs(),
        ],
      ),
    );
  }
}
