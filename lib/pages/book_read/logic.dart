import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:origin_novel/app/constants/default_setting.dart';

import '../../app/constants/assets.dart';
import '../../app/database/app_database.dart';
import '../../app/database/models/models.dart';
import '../../app/l10n/generated/l10n.dart';
import '../../app/theme/app_theme.dart';
import '../../util/dialog/dialog_utils.dart';
import '../../util/log_utils.dart';
import 'state.dart';

class BookReadLogic extends GetxController {
  final BookReadState state = BookReadState();
  late TextPainter _textPainter;
  final _isar = AppDatabase.isarInstance;

  @override
  void onInit() {
    super.onInit();
    // 读取默认设置
    state.bookReadSetting = _isar.bookReadSettings
            .where()
            .idEqualTo(DefaultSetting.defaultBookReadSettingId)
            .findFirst() ??
        BookReadSetting(
          id: DefaultSetting.defaultBookReadSettingId,
          updateTime: DateTime.now(),
          pageFlipType: PageFlipType.slideLeftOrRight,
          fontSize: DefaultSetting.defaultBookReadSettingFontSize,
          fontHeight: DefaultSetting.defaultBookReadSettingFontHeight,
          wordSpacing: DefaultSetting.defaultBookReadSettingWordSpacing,
          letterSpacing: DefaultSetting.defaultBookReadSettingLetterSpacing,
        );
    // 保存默认设置
    _isar.write(
      (isar) {
        isar.bookReadSettings.put(state.bookReadSetting);
      },
    );
    // 创建TextStyle
    state.contentStyle = TextStyle(
      fontSize: state.bookReadSetting.fontSize,
      height: state.bookReadSetting.fontHeight,
      wordSpacing: state.bookReadSetting.wordSpacing,
      letterSpacing: state.bookReadSetting.letterSpacing,
      fontFamily: state.bookReadSetting.fontFamily,
    );
    // 创建PageController
    state.pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );

    // 初始化章节
    state.directory = HashMap();
    state.directory.addAll({
      1: Assets.contentChapterI,
      2: Assets.contentChapterIi,
    });
    state.currentChapter = 1;
    state.totalChapter = state.directory.length;
  }

  @override
  void onReady() {
    super.onReady();
    _textPainter = TextPainter(
      text: TextSpan(
        text: "测",
        style: state.contentStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
        maxWidth: state.contentStyle.fontSize ??
            DefaultSetting.defaultBookReadSettingFontSize * 2);
    loadChapter(chapter: state.currentChapter);
  }

  @override
  void onClose() {
    _textPainter.dispose();
    super.onClose();
  }

  void sliderOnPageProcessChange(double value) {
    state.currentPage = value.toInt();
    state.pageController.jumpToPage(state.currentPage);
    update();
  }

  void pageOnPageProcessChange(int value) {
    state.currentPage = value;
    update();
  }

  void onDragStart(DragStartDetails details) {
    switch (state.bookReadSetting.pageFlipType) {
      case PageFlipType.slideLeftOrRight:
        state.startDrag = details.globalPosition.dx;
        break;
      case PageFlipType.slideUpAndDown:
        state.startDrag = details.globalPosition.dy;
    }
    state.totalDrag = 0.0;
  }

  void onDragUpdate(DragUpdateDetails details) {
    switch (state.bookReadSetting.pageFlipType) {
      case PageFlipType.slideLeftOrRight:
        state.totalDrag += details.delta.dx;
        break;
      case PageFlipType.slideUpAndDown:
        state.totalDrag += details.delta.dy;
    }
  }

  void onDragEnd(DragEndDetails details) {
    if (state.totalDrag < 0 && state.currentPage >= state.pageSize - 1) {
      nextChapter();
    } else if (state.totalDrag > 0 && state.currentPage <= 0) {
      previousChapter();
    }
    // 重置滑动偏移量
    state.totalDrag = 0.0;
  }

  /// 切换 AppBar 显示隐藏
  void toggleAppBarVisibility() {
    state.isAppBarVisible = !state.isAppBarVisible;
    update();
  }

  /// 加载章节
  Future<void> loadChapter({required int chapter}) async {
    if (state.directory.containsKey(chapter)) {
      DialogUtils.loading();
      state.bookContent =
          await rootBundle.loadString(state.directory[chapter]!);
      // 计算分页
      state.currentBookContentPage = [];
      _splitBookContent();
      update();
      await DialogUtils.dismiss();
      LogUtils.d('加载第 $chapter 章节完成');
    } else {
      DialogUtils.danger(S.current.chapterDoesNotExist);
    }
  }

  /// 上一章
  Future<void> previousChapter() async {
    final chapter = state.currentChapter - 1;
    if (chapter <= 0) {
      DialogUtils.danger(S.current.thereAreNoChaptersAhead);
      return;
    }

    loadChapter(chapter: chapter);
  }

  /// 下一章
  Future<void> nextChapter() async {
    final chapter = state.currentChapter + 1;
    if (chapter > state.totalChapter) {
      DialogUtils.danger(S.current.thereAreNoMoreChaptersToCome);
      return;
    }

    loadChapter(chapter: chapter);
  }

  /// 上一页
  void previousPage() {
    if (state.currentPage > 0) {
      state.currentPage--;
      state.pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      previousChapter();
    }
  }

  /// 下一页
  void nextPage() {
    if (state.currentPage < state.pageSize - 1) {
      state.currentPage++;
      state.pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      nextChapter();
    }
  }

  /// 键盘事件
  void onKeyboardEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          previousPage();
          break;
        case LogicalKeyboardKey.arrowRight:
          nextPage();
          break;
      }
    }
  }

  /// 将书的内容分页
  void _splitBookContent() {
    _calculate();
    // 首先对内容分割
    final List<String> contentLineList = state.bookContent.split('\n');
    int maxLineLength = contentLineList.length;
    int currentLine = 0;
    // 遍历每一行
    while (currentLine < maxLineLength) {
      List<String> currentPageContent = [];
      int traversalLength = 0;

      for (traversalLength;
          traversalLength < (min(state.lineCount, contentLineList.length));
          traversalLength++) {
        // 获取当前行的长度
        var line = contentLineList[traversalLength];
        final strLength = line.length;

        currentPageContent.add(line);
        // 如果当前行的长度大于最大长度
        if (strLength > state.charCount) {
          final ceil = (strLength / state.charCount).ceil();
          traversalLength += ceil - 1;
          currentLine += ceil;
          continue;
        }
        currentLine++;
      }
      // 结束后添加到列表中
      // 删除头尾的空行
      if (currentPageContent.first.isEmpty ||
          currentPageContent.first == '\r') {
        currentPageContent.removeAt(0);
      }
      if (currentPageContent.last.isEmpty || currentPageContent.last == '\r') {
        currentPageContent.removeLast();
      }

      state.currentBookContentPage.add(currentPageContent.join('\n'));
      // 移除contentLineList前面内容
      contentLineList.removeRange(0, traversalLength);
    }
    state.pageSize = state.currentBookContentPage.length;
  }

  /// 计算页面最多放多少行文字和每行多少个字
  void _calculate() {
    final BuildContext context = Get.context!;
    // 计算页面最多放多少行文字
    double screenHeight = context.height;
    double screenWidth = context.width;
    // 如果屏幕大小和之前一样，则不需要重新计算
    if (screenWidth == state.screenWidth &&
        screenHeight == state.screenHeight &&
        !state.isFontSizeChanged &&
        state.lineCount != -1 &&
        state.charCount != -1) {
      return;
    }

    // 一个文字大小
    final fontHeight = _textPainter.height;
    final fontWidth = _textPainter.width;
    LogUtils.d('fontHeight: $fontHeight, fontWidth: $fontWidth');
    // 计算每行多少个字
    final double lineWidth = screenWidth - BookReadTheme.padding * 2;
    final double lineHeight = screenHeight - BookReadTheme.padding * 2;
    // 向上取整
    final int lineCount = (lineHeight / fontHeight).floor();
    final int charCount = (lineWidth / fontWidth).floor();
    state.lineCount = lineCount;
    state.charCount = charCount;
    state.screenWidth = screenWidth;
    state.screenHeight = screenHeight;
    LogUtils.d('lineCount: $lineCount, charCount: $charCount');
  }
}
