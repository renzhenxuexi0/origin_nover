use crate::api::model::book_source::BookSource;

pub async fn parse_book_source_from_url(url: &str) -> Result<Vec<BookSource>, reqwest::Error> {
    reqwest::get(url).await?.json::<Vec<BookSource>>().await
}

#[cfg(test)]
mod tests {
    use crate::api::parse_book_source::parse_book_source_from_url;

    #[tokio::test]
    async fn test_parse_json() -> Result<(), reqwest::Error> {
        // 测试解析速度
        let now = std::time::Instant::now();
        let vec = parse_book_source_from_url("https://github.moeyy.xyz/https://raw.githubusercontent.com/XIU2/Yuedu/master/shuyuan")
            .await?;
        println!("解析耗时: {:?} 解析内容: {:?}", now.elapsed(), vec);
        Ok(())

        // // 遍历books数组中的每个条目
        // for book in books {
        //     // 尝试获取每个条目中的exploreUrl字段
        //     if let Some(explore_url_str) = book["exploreUrl"].as_str() {
        //         println!("{}", explore_url_str);
        //         // 将exploreUrl字段的字符串值解析为serde_json::Value
        //         let explore_url_value: Value = serde_json::from_str(explore_url_str)?;
        //
        //         // 然后，将这个Value解析为Vec<Value>或其他目标类型
        //         let result: Vec<Value> = serde_json::from_value(explore_url_value)?;
        //
        //         // 在这里处理或打印解析后的结果
        //         println!("{:#?}", result);
        //     }
        // }
    }
}