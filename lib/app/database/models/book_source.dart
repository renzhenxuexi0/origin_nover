part of 'models.dart';

@Freezed(fromJson: false, toJson: false)
@collection
class BookSource with _$BookSource {
  const factory BookSource({
    required int id,
    required String bookSourceName,
    required String bookSourceUrl,

    /// 书源备注
    String? bookSourceComment,

    /// 书源分组
    String? bookSourceGroup,

    /// 手动排序编号
    int? customOrder,

    /// 每次请求的cookie
    bool? enabledCookieJar,

    /// 启用发现
    bool? enabledExplore,

    /// 发现url
    String? exploreUrl,

    /// 最后更新时间，用于排序
    int? lastUpdateTime,

    /// 响应时间，用于排序
    int? respondTime,

    /// 书籍信息页规则
    RuleBookInfo? ruleBookInfo,

    /// 正文页规则
    RuleContent? ruleContent,

    /// 发现规则
    RuleExplore? ruleExplore,

    /// 段评规则
    RuleReview? ruleReview,

    /// 搜索规则
    RuleSearch? ruleSearch,

    /// 目录页规则
    RuleToc? ruleToc,

    /// 搜索url
    String? searchUrl,

    /// 智能排序的权重
    int? weight,
    String? bookUrlPattern,

    /// 书源类型，0 文本，1 音频, 2 图片, 3 文件（指的是类似知轩藏书只提供下载的网站）
    int? bookSourceType,
    String? header,
    String? loginUrl,

    /// 是否启用
    @Default(true) bool enabled,
  }) = _BookSource;
}
