import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/l10n/generated/l10n.dart';
import 'logic.dart';

const _searchHeight = 30.0;

class BookSourcePage extends StatelessWidget {
  BookSourcePage({super.key});

  final logic = Get.find<BookSourceLogic>();
  final state = Get.find<BookSourceLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).bookSource(1))),
      body: Column(
        children: [
          // 筛选栏
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).all),
              ),
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).enabled),
              ),
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).disabled),
              ),
            ],
          ),
          const Divider(),
          // 搜索输入框
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: _searchHeight,
            child: TextField(
              controller: state.searchController,
              onChanged: logic.onSearchChanged,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(vertical: _searchHeight / 2 - 14),
              ),
            ),
          ),
          const Divider(),
          // 书源列表
          Expanded(
            child: GetBuilder<BookSourceLogic>(builder: (logic) {
              return ListView.builder(
                itemBuilder: itemBuilder,
                itemCount: state.showBookSources.length,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Row(
        children: [
          Text(state.showBookSources[index].bookSourceName),
          const Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).topping),
              ),
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).disabled),
              ),
              TextButton(
                onPressed: () {},
                child: Text(S.of(context).delete),
              ),
            ],
          )
        ],
      ),
      hoverColor: context.theme.hoverColor,
      onTap: () {
        // TODO: 查看书源详情
      },
    );
  }
}
