use aho_corasick::AhoCorasick;
use regex::Regex;

use super::tags::OtherTags;

pub fn convert_place_name(name: &str) -> String {
    // 按后缀长度降序排列，确保长后缀优先匹配
    let suffixes = [
        "特别行政区",
        "自治区",
        "自治州",
        "自治县",
        "自治旗",
        "林区",
        "矿区",
        "地区",
        "盟",
        "省",
        "市",
        "区",
        "县",
        "旗",
    ];

    // 遍历所有后缀进行匹配
    for suffix in &suffixes {
        if name.ends_with(suffix) {
            return format!("某某{}", suffix);
        }
    }

    // 未匹配后缀时返回原名称（根据需求可改为默认处理）
    name.to_string()
}

pub fn label_keyword_text(text: &str, keywords: Vec<String>) -> Vec<(String, OtherTags)> {
    let ac = AhoCorasick::new(keywords).unwrap();

    let mut last_end = 0;
    let mut result = Vec::new();

    for mat in ac.find_iter(text) {
        if mat.start() > last_end {
            result.push((text[last_end..mat.start()].to_string(), OtherTags::Other));
        }
        result.push((text[mat.start()..mat.end()].to_string(), OtherTags::Keyword));
        last_end = mat.end();
    }

    if last_end < text.len() {
        result.push((text[last_end..].to_string(), OtherTags::Other));
    }

    result
}

pub fn label_regex_text(text: &str, pattern: String) -> Vec<(String, OtherTags)> {
    let re = Regex::new(&pattern);
    match re {
        Ok(_r) => {
            let mut last_end = 0;
            let mut result = Vec::new();
            for mat in _r.find_iter(text) {
                if mat.start() > last_end {
                    result.push((text[last_end..mat.start()].to_string(), OtherTags::Other));
                }
                result.push((mat.as_str().to_string(), OtherTags::Regex));
                last_end = mat.end();
            }

            if last_end < text.len() {
                result.push((text[last_end..].to_string(), OtherTags::Other));
            }

            result
        }
        Err(_) => {
            return vec![(text.to_string(), OtherTags::Other)];
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::nlp::tags::OtherTags;

    #[test]
    fn test_label_keyword_text() {
        let text = "这是一个关键词测试";
        let keywords = vec!["关键词".to_string()];
        let result = super::label_keyword_text(text, keywords);
        assert_eq!(
            result,
            vec![
                ("这是一个".to_string(), OtherTags::Other),
                ("关键词".to_string(), OtherTags::Keyword),
                ("测试".to_string(), OtherTags::Other)
            ]
        );
    }
}
