import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/database/models/models.dart';
import '../../../app/l10n/generated/l10n.dart';
import '../../../widget/gap.dart';
import 'logic.dart';
import 'state.dart';

class SourcePage extends StatelessWidget {
  SourcePage({super.key});

  final logic = Get.find<SourceLogic>();
  final state = Get.find<SourceLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('书源'),
        actions: [
          // 菜单按钮
          PopupMenuButton(
            offset: const Offset(0, 20),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'refresh',
                  height: 40,
                  child: Center(child: Text('刷新书源')),
                ),
              ];
            },
            tooltip: '更多操作',
            onSelected: (value) {
              // TODO 刷新书源
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: GetBuilder<SourceLogic>(builder: (logic) {
              return SegmentedButton(
                multiSelectionEnabled: false,
                segments: const [
                  ButtonSegment(
                    label: Text('全部'),
                    value: ShowType.all,
                  ),
                  ButtonSegment(
                    label: Text('启用'),
                    value: ShowType.enabled,
                  ),
                  ButtonSegment(
                    label: Text('禁用'),
                    value: ShowType.disabled,
                  ),
                ],
                selected: {state.showType},
                onSelectionChanged: (showType) {
                  switch (showType.first) {
                    case ShowType.all:
                      logic.getAllSources();
                      break;
                    case ShowType.enabled:
                      logic.getEnabledSources();
                      break;
                    case ShowType.disabled:
                      logic.getDisabledSources();
                      break;
                  }
                },
              );
            }),
          ),
          const Gap.vn(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: double.infinity,
            child: TextField(
              onChanged: (value) {
                logic.searchSources(value);
              },
              decoration: const InputDecoration(
                hintText: '输入关键词用于过滤书源',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<SourceLogic>(
              builder: (logic) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return SourceItem(
                      bookSource: state.showSources[index],
                    );
                  },
                  itemCount: state.showSources.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SourceItem extends StatelessWidget {
  const SourceItem({super.key, required this.bookSource});

  final BookSource bookSource;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        child: ListTile(
          title: Text(bookSource.bookSourceName),
          subtitle: Text(bookSource.bookSourceUrl),
          trailing: Text(bookSource.enabled == true
              ? S.of(context).enabled
              : S.of(context).disabled),
        ),
      ),
    );
  }
}
