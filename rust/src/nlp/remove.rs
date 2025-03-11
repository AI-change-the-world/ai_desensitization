use super::{tags::WordcutTag, words::Words};

impl Words {
    pub fn remove(&mut self, i18n: String) -> String {
        match i18n.as_str() {
            "zh_cn" => {
                for word in self.0.iter_mut() {
                    match &word.tag {
                        super::words::Tag::Wordcut(wordcut_tag) => match wordcut_tag {
                            WordcutTag::Nr => {
                                word.word = "[人名]".to_string();
                            }
                            WordcutTag::Nt => {
                                word.word = "[机构名]".to_string();
                            }
                            _ => {}
                        },
                        super::words::Tag::Others(other_tags) => match other_tags {
                            super::tags::OtherTags::Keyword => {
                                word.word = "[关键字]".to_string();
                            }
                            super::tags::OtherTags::Regex => {
                                word.word = "[正则匹配]".to_string();
                            }
                            _ => {}
                        },
                    }
                }
            }
            _ => {}
        }
        self.join("")
    }

    pub fn remove_with_tags(&mut self, i18n: String) -> Words {
        match i18n.as_str() {
            "zh_cn" => {
                for word in self.0.iter_mut() {
                    match &word.tag {
                        super::words::Tag::Wordcut(wordcut_tag) => match wordcut_tag {
                            WordcutTag::Nr => {
                                word.word = "[人名]".to_string();
                            }
                            WordcutTag::Nt => {
                                word.word = "[机构名]".to_string();
                            }
                            _ => {}
                        },
                        super::words::Tag::Others(other_tags) => match other_tags {
                            super::tags::OtherTags::Keyword => {
                                word.word = "[关键字]".to_string();
                            }
                            super::tags::OtherTags::Regex => {
                                word.word = "[正则匹配]".to_string();
                            }
                            _ => {}
                        },
                    }
                }
            }
            _ => {}
        }
        self.clone()
    }
}
