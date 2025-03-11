use std::sync::RwLock;

use jieba_rs::Jieba;
use once_cell::sync::Lazy;

use super::{
    tags::{OtherTags, WordcutTag},
    utils::{label_keyword_text, label_regex_text},
};

#[derive(Debug, Clone)]
pub enum Tag {
    Wordcut(WordcutTag),
    Others(OtherTags),
}

#[derive(Debug, Clone)]
pub struct Word {
    pub word: String,
    pub tag: Tag,
}

#[derive(Debug, Clone)]
pub struct Words(pub Vec<Word>);

static JIEBA: Lazy<RwLock<Jieba>> = Lazy::new(|| {
    let mut jieba = Jieba::new();
    jieba.add_word("张三", Some(1000), Some("nr"));
    jieba.add_word("江苏大门科技有限公司", Some(1000), Some("nt"));
    jieba.add_word("李四相", Some(0), Some("nr"));
    RwLock::new(jieba)
});

pub fn add_word(word: &str, freq: usize, tag: &str) {
    let mut j = JIEBA.write().unwrap();
    (*j).add_word(word, Some(freq), Some(tag));
}

impl Words {
    fn from_wordcut_list(words: Vec<(String, WordcutTag)>) -> Self {
        let mut result: Vec<Word> = Vec::new();
        for word in words {
            result.push(Word {
                word: word.0,
                tag: Tag::Wordcut(word.1),
            });
        }
        Words(result)
    }

    fn from_other_tag_list(words: Vec<(String, OtherTags)>) -> Self {
        let mut result: Vec<Word> = Vec::new();
        for word in words {
            result.push(Word {
                word: word.0,
                tag: Tag::Others(word.1),
            });
        }
        Words(result)
    }

    pub fn from_str_with_wordcut(word: &str) -> Self {
        let j = JIEBA.read().unwrap();
        let words = j.tag(word, true);
        let mut result: Vec<(String, WordcutTag)> = Vec::new();
        for word in words {
            match word.tag {
                "n" => result.push((word.word.to_string(), WordcutTag::N)),
                "nr" => result.push((word.word.to_string(), WordcutTag::Nr)),
                "ns" => result.push((word.word.to_string(), WordcutTag::Ns)),
                "nt" => result.push((word.word.to_string(), WordcutTag::Nt)),
                "nz" => result.push((word.word.to_string(), WordcutTag::Nz)),
                "v" => result.push((word.word.to_string(), WordcutTag::V)),
                "vd" => result.push((word.word.to_string(), WordcutTag::Vd)),
                "vn" => result.push((word.word.to_string(), WordcutTag::Vn)),
                "a" => result.push((word.word.to_string(), WordcutTag::A)),
                "ad" => result.push((word.word.to_string(), WordcutTag::Ad)),
                "an" => result.push((word.word.to_string(), WordcutTag::An)),
                "d" => result.push((word.word.to_string(), WordcutTag::D)),
                "dg" => result.push((word.word.to_string(), WordcutTag::Dg)),
                "r" => result.push((word.word.to_string(), WordcutTag::R)),
                "rr" => result.push((word.word.to_string(), WordcutTag::Rr)),
                "rz" => result.push((word.word.to_string(), WordcutTag::Rz)),
                "m" => result.push((word.word.to_string(), WordcutTag::M)),
                "mq" => result.push((word.word.to_string(), WordcutTag::Mq)),
                "q" => result.push((word.word.to_string(), WordcutTag::Q)),
                "p" => result.push((word.word.to_string(), WordcutTag::P)),
                "c" => result.push((word.word.to_string(), WordcutTag::C)),
                "u" => result.push((word.word.to_string(), WordcutTag::U)),
                "ug" => result.push((word.word.to_string(), WordcutTag::Ug)),
                "us" => result.push((word.word.to_string(), WordcutTag::Us)),
                "e" => result.push((word.word.to_string(), WordcutTag::E)),
                "o" => result.push((word.word.to_string(), WordcutTag::O)),
                "s" => result.push((word.word.to_string(), WordcutTag::S)),

                _s => {
                    result.push((word.word.to_string(), WordcutTag::X(_s.to_owned())));
                }
            }
        }

        Words::from_wordcut_list(result)
    }

    pub fn from_str_with_keywords(word: &str, keywords: Vec<String>) -> Self {
        let r = label_keyword_text(word, keywords);
        Words::from_other_tag_list(r)
    }

    pub fn from_str_with_regex(word: &str, pat: String) -> Self {
        let r = label_regex_text(word, pat);
        Words::from_other_tag_list(r)
    }

    pub fn join(&self, sep: &str) -> String {
        let mut result = String::new();
        for word in &self.0 {
            result.push_str(&word.word);
            result.push_str(sep);
        }
        result
    }

    pub fn print_human_names(&self) {
        for word in &self.0 {
            match &word.tag {
                Tag::Wordcut(wordcut_tag) => match wordcut_tag {
                    WordcutTag::Nr => {
                        println!("{}", word.word);
                    }
                    _ => {}
                },
                Tag::Others(_) => {}
            }
        }
    }

    pub fn print_company_names(&self) {
        for word in &self.0 {
            match &word.tag {
                Tag::Wordcut(wordcut_tag) => match wordcut_tag {
                    WordcutTag::Nt => {
                        println!("{}", word.word);
                    }
                    _ => {}
                },
                Tag::Others(_) => {}
            }
        }
    }
}
