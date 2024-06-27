use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct BookSource {
    // 注释
    book_source_comment: Option<String>,
    // 分组
    book_source_group: Option<String>,
    // 名称
    book_source_name: Option<String>,
    // 类型，0 文本，1 音频, 2 图片, 3 文件（指的是类似知轩藏书只提供下载的网站）
    book_source_type: Option<i64>,
    // 地址，包括 http/https
    book_source_url: Option<String>,
    // 手动排序编号
    custom_order: Option<i64>,
    // 是否启用
    enabled: Option<bool>,
    // 每次请求的cookie
    enabled_cookie_jar: Option<bool>,
    // 启用发现
    enabled_explore: Option<bool>,
    // 发现url
    explore_url: Option<String>,
    // 最后更新时间，用于排序
    last_update_time: Option<i64>,
    // 响应时间，用于排序
    respond_time: Option<i64>,
    // 书籍信息页规则
    rule_book_info: Option<RuleBookInfo>,
    // 正文页规则
    rule_content: Option<RuleContent>,
    rule_explore: Option<Rule>,
    // 段评规则
    rule_review: Option<RuleReview>,
    rule_search: Option<Rule>,
    // 目录页规则
    rule_toc: Option<RuleToc>,
    search_url: Option<String>,
    weight: Option<i64>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RuleBookInfo {
    author: Option<String>,
    cover_url: Option<String>,
    init: Option<String>,
    intro: Option<String>,
    kind: Option<String>,
    last_chapter: Option<String>,
    name: Option<String>,
    toc_url: Option<String>,
    word_count: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RuleContent {
    content: Option<String>,
    replace_regex: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Rule {
    author: Option<String>,
    book_list: Option<String>,
    book_url: Option<String>,
    cover_url: Option<String>,
    intro: Option<String>,
    name: Option<String>,
    word_count: Option<String>,
    kind: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RuleReview {
    // 段评URL
    review_url: Option<String>,
    // 段评发布者头像
    avatar_rule: Option<String>,
    // 段评内容
    content_rule: Option<String>,
    // 段评发布时间
    post_time_rule: Option<String>,
    // 获取段评回复URL
    review_quote_url: Option<String>,

    // 这些功能将在以上功能完成以后实现
    // 点赞URL
    vote_up_url: Option<String>,
    // 点踩URL
    vote_down_url: Option<String>,
    // 发送回复URL
    post_review_url: Option<String>,
    // 发送回复段评URL
    post_quote_url: Option<String>,
    // 删除段评URL
    delete_url: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RuleToc {
    chapter_list: Option<String>,
    chapter_name: Option<String>,
    chapter_url: Option<String>,
}