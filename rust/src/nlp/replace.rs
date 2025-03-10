use std::collections::HashMap;

use crate::nlp::utils::convert_place_name;

use super::{jieba_tag::JiebaTag, words::Words};

impl Words {
    pub fn replace(&mut self, i18n: String) -> String {
        match i18n.as_str() {
            "zh_cn" => {
                use fake::{
                    faker::{company::zh_cn::CompanyName, name::zh_cn::Name},
                    Fake,
                };
                let mut names: HashMap<String, String> = HashMap::new();
                let mut companies: HashMap<String, String> = HashMap::new();
                let mut places: HashMap<String, String> = HashMap::new();
                for word in self.0.iter_mut() {
                    match word.tag {
                        JiebaTag::Nr => {
                            if names.contains_key(&word.word) {
                                word.word = names.get(&word.word).unwrap().clone();
                                continue;
                            }
                            word.word = Name().fake();
                            names.insert(word.word.clone(), word.word.clone());
                        }
                        JiebaTag::Ns => {
                            if places.contains_key(&word.word) {
                                word.word = places.get(&word.word).unwrap().clone();
                                continue;
                            }
                            word.word = convert_place_name(&word.word);
                            places.insert(word.word.clone(), word.word.clone());
                        }
                        JiebaTag::Nt => {
                            if companies.contains_key(&word.word) {
                                word.word = companies.get(&word.word).unwrap().clone();
                                continue;
                            }
                            word.word = CompanyName().fake();
                            companies.insert(word.word.clone(), word.word.clone());
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
