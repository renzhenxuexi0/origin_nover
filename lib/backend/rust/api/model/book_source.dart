// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.37.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// The functions `fmt`, `clone`, `fmt`, `clone`, `fmt`, `clone`, `fmt`, `clone`, `fmt`, `clone`, `fmt`, `clone`, `fmt`, `clone` are not `pub`, thus are ignored.

/// 书源结构定义
class BookSource {
  /// 书源备注
  final String? bookSourceComment;

  /// 书源分组
  final String? bookSourceGroup;

  /// 书源名称
  final String? bookSourceName;

  /// 书源类型，0 文本，1 音频, 2 图片, 3 文件（指的是类似知轩藏书只提供下载的网站）
  final PlatformInt64? bookSourceType;

  /// 书源地址，包括 http/https
  final String? bookSourceUrl;

  /// 手动排序编号
  final PlatformInt64? customOrder;

  /// 是否启用
  final bool? enabled;

  /// 每次请求的cookie
  final bool? enabledCookieJar;

  /// 启用发现
  final bool? enabledExplore;

  /// 发现url
  final String? exploreUrl;

  /// 最后更新时间，用于排序
  final PlatformInt64? lastUpdateTime;

  /// 响应时间，用于排序
  final PlatformInt64? respondTime;

  /// 书籍信息页规则
  final RuleBookInfo? ruleBookInfo;

  /// 正文页规则
  final RuleContent? ruleContent;

  /// 发现规则
  final RuleExplore? ruleExplore;

  /// 段评规则
  final RuleReview? ruleReview;

  /// 搜索规则
  final RuleSearch? ruleSearch;

  /// 目录页规则
  final RuleToc? ruleToc;

  /// 搜索url
  final String? searchUrl;

  /// 智能排序的权重
  final PlatformInt64? weight;

  const BookSource({
    this.bookSourceComment,
    this.bookSourceGroup,
    this.bookSourceName,
    this.bookSourceType,
    this.bookSourceUrl,
    this.customOrder,
    this.enabled,
    this.enabledCookieJar,
    this.enabledExplore,
    this.exploreUrl,
    this.lastUpdateTime,
    this.respondTime,
    this.ruleBookInfo,
    this.ruleContent,
    this.ruleExplore,
    this.ruleReview,
    this.ruleSearch,
    this.ruleToc,
    this.searchUrl,
    this.weight,
  });

  @override
  int get hashCode =>
      bookSourceComment.hashCode ^
      bookSourceGroup.hashCode ^
      bookSourceName.hashCode ^
      bookSourceType.hashCode ^
      bookSourceUrl.hashCode ^
      customOrder.hashCode ^
      enabled.hashCode ^
      enabledCookieJar.hashCode ^
      enabledExplore.hashCode ^
      exploreUrl.hashCode ^
      lastUpdateTime.hashCode ^
      respondTime.hashCode ^
      ruleBookInfo.hashCode ^
      ruleContent.hashCode ^
      ruleExplore.hashCode ^
      ruleReview.hashCode ^
      ruleSearch.hashCode ^
      ruleToc.hashCode ^
      searchUrl.hashCode ^
      weight.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookSource &&
          runtimeType == other.runtimeType &&
          bookSourceComment == other.bookSourceComment &&
          bookSourceGroup == other.bookSourceGroup &&
          bookSourceName == other.bookSourceName &&
          bookSourceType == other.bookSourceType &&
          bookSourceUrl == other.bookSourceUrl &&
          customOrder == other.customOrder &&
          enabled == other.enabled &&
          enabledCookieJar == other.enabledCookieJar &&
          enabledExplore == other.enabledExplore &&
          exploreUrl == other.exploreUrl &&
          lastUpdateTime == other.lastUpdateTime &&
          respondTime == other.respondTime &&
          ruleBookInfo == other.ruleBookInfo &&
          ruleContent == other.ruleContent &&
          ruleExplore == other.ruleExplore &&
          ruleReview == other.ruleReview &&
          ruleSearch == other.ruleSearch &&
          ruleToc == other.ruleToc &&
          searchUrl == other.searchUrl &&
          weight == other.weight;
}

/// 书籍信息页规则结构定义
class RuleBookInfo {
  final String? author;
  final String? coverUrl;
  final String? init;
  final String? intro;
  final String? kind;
  final String? lastChapter;
  final String? name;
  final String? tocUrl;
  final String? wordCount;
  final String? downloadUrl;
  final String? canReName;

  const RuleBookInfo({
    this.author,
    this.coverUrl,
    this.init,
    this.intro,
    this.kind,
    this.lastChapter,
    this.name,
    this.tocUrl,
    this.wordCount,
    this.downloadUrl,
    this.canReName,
  });

  @override
  int get hashCode =>
      author.hashCode ^
      coverUrl.hashCode ^
      init.hashCode ^
      intro.hashCode ^
      kind.hashCode ^
      lastChapter.hashCode ^
      name.hashCode ^
      tocUrl.hashCode ^
      wordCount.hashCode ^
      downloadUrl.hashCode ^
      canReName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleBookInfo &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          coverUrl == other.coverUrl &&
          init == other.init &&
          intro == other.intro &&
          kind == other.kind &&
          lastChapter == other.lastChapter &&
          name == other.name &&
          tocUrl == other.tocUrl &&
          wordCount == other.wordCount &&
          downloadUrl == other.downloadUrl &&
          canReName == other.canReName;
}

/// 正文页规则结构定义
class RuleContent {
  final String? content;
  final String? replaceRegex;
  final String? title;
  final String? nextContentUrl;
  final String? webJs;
  final String? sourceRegex;
  final String? imageStyle;
  final String? payAction;

  const RuleContent({
    this.content,
    this.replaceRegex,
    this.title,
    this.nextContentUrl,
    this.webJs,
    this.sourceRegex,
    this.imageStyle,
    this.payAction,
  });

  @override
  int get hashCode =>
      content.hashCode ^
      replaceRegex.hashCode ^
      title.hashCode ^
      nextContentUrl.hashCode ^
      webJs.hashCode ^
      sourceRegex.hashCode ^
      imageStyle.hashCode ^
      payAction.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleContent &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          replaceRegex == other.replaceRegex &&
          title == other.title &&
          nextContentUrl == other.nextContentUrl &&
          webJs == other.webJs &&
          sourceRegex == other.sourceRegex &&
          imageStyle == other.imageStyle &&
          payAction == other.payAction;
}

/// 发现规则结构定义
class RuleExplore {
  final String? author;
  final String? bookList;
  final String? bookUrl;
  final String? coverUrl;
  final String? lastChapter;
  final String? intro;
  final String? name;
  final String? wordCount;
  final String? kind;

  const RuleExplore({
    this.author,
    this.bookList,
    this.bookUrl,
    this.coverUrl,
    this.lastChapter,
    this.intro,
    this.name,
    this.wordCount,
    this.kind,
  });

  @override
  int get hashCode =>
      author.hashCode ^
      bookList.hashCode ^
      bookUrl.hashCode ^
      coverUrl.hashCode ^
      lastChapter.hashCode ^
      intro.hashCode ^
      name.hashCode ^
      wordCount.hashCode ^
      kind.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleExplore &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          bookList == other.bookList &&
          bookUrl == other.bookUrl &&
          coverUrl == other.coverUrl &&
          lastChapter == other.lastChapter &&
          intro == other.intro &&
          name == other.name &&
          wordCount == other.wordCount &&
          kind == other.kind;
}

/// 段评规则结构定义
class RuleReview {
  /// 段评URL
  final String? reviewUrl;

  /// 段评发布者头像规则
  final String? avatarRule;

  /// 段评内容规则
  final String? contentRule;

  /// 段评发布时间规则
  final String? postTimeRule;

  /// 获取段评回复URL
  final String? reviewQuoteUrl;

  /// 点赞URL
  final String? voteUpUrl;

  /// 点踩URL
  final String? voteDownUrl;

  /// 发送回复URL
  final String? postReviewUrl;

  /// 发送回复段评URL
  final String? postQuoteUrl;

  /// 删除段评URL
  final String? deleteUrl;

  const RuleReview({
    this.reviewUrl,
    this.avatarRule,
    this.contentRule,
    this.postTimeRule,
    this.reviewQuoteUrl,
    this.voteUpUrl,
    this.voteDownUrl,
    this.postReviewUrl,
    this.postQuoteUrl,
    this.deleteUrl,
  });

  @override
  int get hashCode =>
      reviewUrl.hashCode ^
      avatarRule.hashCode ^
      contentRule.hashCode ^
      postTimeRule.hashCode ^
      reviewQuoteUrl.hashCode ^
      voteUpUrl.hashCode ^
      voteDownUrl.hashCode ^
      postReviewUrl.hashCode ^
      postQuoteUrl.hashCode ^
      deleteUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleReview &&
          runtimeType == other.runtimeType &&
          reviewUrl == other.reviewUrl &&
          avatarRule == other.avatarRule &&
          contentRule == other.contentRule &&
          postTimeRule == other.postTimeRule &&
          reviewQuoteUrl == other.reviewQuoteUrl &&
          voteUpUrl == other.voteUpUrl &&
          voteDownUrl == other.voteDownUrl &&
          postReviewUrl == other.postReviewUrl &&
          postQuoteUrl == other.postQuoteUrl &&
          deleteUrl == other.deleteUrl;
}

/// 搜索规则结构定义
class RuleSearch {
  final String? author;
  final String? bookList;
  final String? bookUrl;
  final String? coverUrl;
  final String? intro;
  final String? name;
  final String? wordCount;
  final String? kind;

  const RuleSearch({
    this.author,
    this.bookList,
    this.bookUrl,
    this.coverUrl,
    this.intro,
    this.name,
    this.wordCount,
    this.kind,
  });

  @override
  int get hashCode =>
      author.hashCode ^
      bookList.hashCode ^
      bookUrl.hashCode ^
      coverUrl.hashCode ^
      intro.hashCode ^
      name.hashCode ^
      wordCount.hashCode ^
      kind.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleSearch &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          bookList == other.bookList &&
          bookUrl == other.bookUrl &&
          coverUrl == other.coverUrl &&
          intro == other.intro &&
          name == other.name &&
          wordCount == other.wordCount &&
          kind == other.kind;
}

/// 目录页规则结构定义
class RuleToc {
  final String? chapterList;
  final String? chapterName;
  final String? chapterUrl;
  final String? isVolume;
  final String? preUpdateJson;
  final String? formatJs;
  final String? isVip;
  final String? isPay;
  final String? nextTocUrl;
  final String? updateTime;

  const RuleToc({
    this.chapterList,
    this.chapterName,
    this.chapterUrl,
    this.isVolume,
    this.preUpdateJson,
    this.formatJs,
    this.isVip,
    this.isPay,
    this.nextTocUrl,
    this.updateTime,
  });

  @override
  int get hashCode =>
      chapterList.hashCode ^
      chapterName.hashCode ^
      chapterUrl.hashCode ^
      isVolume.hashCode ^
      preUpdateJson.hashCode ^
      formatJs.hashCode ^
      isVip.hashCode ^
      isPay.hashCode ^
      nextTocUrl.hashCode ^
      updateTime.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleToc &&
          runtimeType == other.runtimeType &&
          chapterList == other.chapterList &&
          chapterName == other.chapterName &&
          chapterUrl == other.chapterUrl &&
          isVolume == other.isVolume &&
          preUpdateJson == other.preUpdateJson &&
          formatJs == other.formatJs &&
          isVip == other.isVip &&
          isPay == other.isPay &&
          nextTocUrl == other.nextTocUrl &&
          updateTime == other.updateTime;
}
