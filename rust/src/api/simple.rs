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
    use serde::{Deserialize, Serialize};
    use serde_json::Value;

    #[derive(Serialize, Deserialize, Debug)]
    struct Url {
        title: String,
        url: String,
        style: String,
    }

    #[test]
    fn test_parse_json() {
        // 读取文件 assets/book_store.json
        let json = std::fs::read_to_string("D:/flutter_project/origin_novel/rust/assets/new.json").unwrap().to_string();
        let books: Value = serde_json::from_str(&json).unwrap();
        let explore = books.get("exploreUrl").unwrap().to_string();
        let result_string = explore.replace("\\\"", "\"").replace("\\n", "").replace("\\\\", "\\");
        let result = &result_string[2..(result_string.len() - 2)];


        // println!("books = {:#?}", serde_json::from_str::<Value>(result).unwrap());
        println!("books = {:#?}", result);
    }
}