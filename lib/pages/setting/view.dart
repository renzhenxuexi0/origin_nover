import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/gap.dart';
import 'logic.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              logic.changeThemeMode(null);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('切换主题'),
                      const Gap.vs(),
                      Text(
                        '当前主题：${logic.themeModeText}',
                        style: context.theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GetBuilder<SettingLogic>(builder: (logic) {
                    return ToggleButtons(
                        isSelected: [
                          state.themeMode == ThemeMode.light,
                          state.themeMode == ThemeMode.system,
                          state.themeMode == ThemeMode.dark,
                        ],
                        onPressed: (index) {
                          logic.changeThemeMode([
                            ThemeMode.light,
                            ThemeMode.system,
                            ThemeMode.dark,
                          ][index]);
                        },
                        children: const [
                          Icon(Icons.light_mode),
                          Icon(Icons.settings_suggest),
                          Icon(Icons.dark_mode),
                        ]);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
