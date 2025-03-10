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
