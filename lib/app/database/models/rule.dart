part of 'models.dart';

/// 书籍信息页规则结构定义
@embedded
class RuleBookInfo {
  String? author;
  String? coverUrl;
  String? init;
  String? intro;
  String? kind;
  String? lastChapter;
  String? name;
  String? tocUrl;
  String? wordCount;
  String? downloadUrl;
  String? canReName;
}

/// 正文页规则结构定义
@embedded
class RuleContent {
  String? content;
  String? replaceRegex;
  String? title;
  String? nextContentUrl;
  String? webJs;
  String? sourceRegex;
  String? imageStyle;
  String? payAction;
}

/// 发现规则结构定义
@embedded
class RuleExplore {
  String? author;
  String? bookList;
  String? bookUrl;
  String? coverUrl;
  String? lastChapter;
  String? intro;
  String? name;
  String? wordCount;
  String? kind;
}

/// 段评规则结构定义
@embedded
class RuleReview {
  /// 段评URL
  String? reviewUrl;

  /// 段评发布者头像规则
  String? avatarRule;

  /// 段评内容规则
  String? contentRule;

  /// 段评发布时间规则
  String? postTimeRule;

  /// 获取段评回复URL
  String? reviewQuoteUrl;

  /// 点赞URL
  String? voteUpUrl;

  /// 点踩URL
  String? voteDownUrl;

  /// 发送回复URL
  String? postReviewUrl;

  /// 发送回复段评URL
  String? postQuoteUrl;

  /// 删除段评URL
  String? deleteUrl;
}

/// 搜索规则结构定义
@embedded
class RuleSearch {
  String? author;
  String? bookList;
  String? bookUrl;
  String? coverUrl;
  String? intro;
  String? name;
  String? wordCount;
  String? kind;
}

/// 目录页规则结构定义
@embedded
class RuleToc {
  String? chapterList;
  String? chapterName;
  String? chapterUrl;
  String? isVolume;
  String? preUpdateJson;
  String? formatJs;
  String? isVip;
  String? isPay;
  String? nextTocUrl;
  String? updateTime;
}
