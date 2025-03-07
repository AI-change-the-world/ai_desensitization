use super::{jieba_tag::JiebaTag, words::Words};

impl Words {
    pub fn replace(&mut self, i18n: String) -> String {
        match i18n.as_str() {
            "zh_cn" => {
                use fake::{
                    faker::{company::zh_cn::CompanyName, name::zh_cn::Name},
                    Fake,
                };
                for word in self.0.iter_mut() {
                    match word.tag {
                        JiebaTag::Nr => {
                            word.word = Name().fake();
                        }
                        JiebaTag::Ns => {
                            word.word = convert_place_name(&word.word);
                        }
                        JiebaTag::Nt => {
                            word.word = CompanyName().fake();
                        }
                        _ => {}
                    }
                }
            }
            _ => {}
        }

        self.join("")
    }

    pub fn replace_with_tag(&mut self, i18n: String) -> Words {
        match i18n.as_str() {
            "zh_cn" => {
                use fake::{
                    faker::{company::zh_cn::CompanyName, name::zh_cn::Name},
                    Fake,
                };
                for word in self.0.iter_mut() {
                    match word.tag {
                        JiebaTag::Nr => {
                            word.word = Name().fake();
                        }
                        JiebaTag::Ns => {
                            word.word = convert_place_name(&word.word);
                        }
                        JiebaTag::Nt => {
                            word.word = CompanyName().fake();
                        }
                        _ => {}
                    }
                }
            }
            _ => {}
        }
        self.clone()
    }
}

fn convert_place_name(name: &str) -> String {
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_conversion() {
        assert_eq!(convert_place_name("北京市"), "某某市");
        assert_eq!(convert_place_name("海淀区"), "某某区");
        assert_eq!(convert_place_name("内蒙古自治区"), "某某自治区");
        assert_eq!(convert_place_name("香港特别行政区"), "某某特别行政区");
        assert_eq!(convert_place_name("大理白族自治州"), "某某自治州");
        assert_eq!(convert_place_name("朝阳区"), "某某区");
        assert_eq!(convert_place_name("浙江省"), "某某省");
        assert_eq!(convert_place_name("阿克塞哈萨克族自治县"), "某某自治县");
    }
}
