pub use std::collections::HashMap;

pub use reqwest;
pub use tokio;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub async fn request() -> Result<String, reqwest::Error> {
    let body = reqwest::get("https://www.rust-lang.org")
        .await?
        .text()
        .await?;

    println!("body = {body:?}");

    return Ok(body);
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}


#[cfg(test)]
mod tests {
    use std::fs;

    use serde_json::Value;

    #[test]
    fn test_parse_json() -> Result<(), serde_json::Error> {
        // 读取JSON文件
        let json = fs::read_to_string("D:\\workspace\\workspace_flutter\\origin_novel\\rust\\assets\\book_source.json").unwrap();
        let books: Vec<Value> = serde_json::from_str(&json).unwrap();

        // 遍历books数组中的每个条目
        for book in books {
            // 尝试获取每个条目中的exploreUrl字段
            if let Some(explore_url_str) = book["exploreUrl"].as_str() {
                // 将exploreUrl字段的字符串值解析为serde_json::Value
                let explore_url_value: Value = serde_json::from_str(explore_url_str)?;

                // 然后，将这个Value解析为Vec<Value>或其他目标类型
                let result: Vec<Value> = serde_json::from_value(explore_url_value)?;

                // 在这里处理或打印解析后的结果
                println!("{:#?}", result);
            }
        }

        Ok(())
    }
}