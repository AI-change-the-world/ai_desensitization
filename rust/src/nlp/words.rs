use std::sync::RwLock;

use jieba_rs::Jieba;
use once_cell::sync::Lazy;

use super::jieba_tag::JiebaTag;

#[derive(Debug, Clone)]
pub struct Word {
    pub word: String,
    pub tag: JiebaTag,
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
    fn from_wordcut_list(words: Vec<(String, JiebaTag)>) -> Self {
        let mut result: Vec<Word> = Vec::new();
        for word in words {
            result.push(Word {
                word: word.0,
                tag: word.1,
            });
        }
        Words(result)
    }

    pub fn from_str_with_wordcut(word: &str) -> Self {
        let j = JIEBA.read().unwrap();
        let words = j.tag(word, true);
        let mut result: Vec<(String, JiebaTag)> = Vec::new();
        for word in words {
            match word.tag {
                "n" => result.push((word.word.to_string(), JiebaTag::N)),
                "nr" => result.push((word.word.to_string(), JiebaTag::Nr)),
                "ns" => result.push((word.word.to_string(), JiebaTag::Ns)),
                "nt" => result.push((word.word.to_string(), JiebaTag::Nt)),
                "nz" => result.push((word.word.to_string(), JiebaTag::Nz)),
                "v" => result.push((word.word.to_string(), JiebaTag::V)),
                "vd" => result.push((word.word.to_string(), JiebaTag::Vd)),
                "vn" => result.push((word.word.to_string(), JiebaTag::Vn)),
                "a" => result.push((word.word.to_string(), JiebaTag::A)),
                "ad" => result.push((word.word.to_string(), JiebaTag::Ad)),
                "an" => result.push((word.word.to_string(), JiebaTag::An)),
                "d" => result.push((word.word.to_string(), JiebaTag::D)),
                "dg" => result.push((word.word.to_string(), JiebaTag::Dg)),
                "r" => result.push((word.word.to_string(), JiebaTag::R)),
                "rr" => result.push((word.word.to_string(), JiebaTag::Rr)),
                "rz" => result.push((word.word.to_string(), JiebaTag::Rz)),
                "m" => result.push((word.word.to_string(), JiebaTag::M)),
                "mq" => result.push((word.word.to_string(), JiebaTag::Mq)),
                "q" => result.push((word.word.to_string(), JiebaTag::Q)),
                "p" => result.push((word.word.to_string(), JiebaTag::P)),
                "c" => result.push((word.word.to_string(), JiebaTag::C)),
                "u" => result.push((word.word.to_string(), JiebaTag::U)),
                "ug" => result.push((word.word.to_string(), JiebaTag::Ug)),
                "us" => result.push((word.word.to_string(), JiebaTag::Us)),
                "e" => result.push((word.word.to_string(), JiebaTag::E)),
                "o" => result.push((word.word.to_string(), JiebaTag::O)),
                "s" => result.push((word.word.to_string(), JiebaTag::S)),

                _s => {
                    result.push((word.word.to_string(), JiebaTag::X(_s.to_owned())));
                }
            }
        }

        Words::from_wordcut_list(result)
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
            match word.tag {
                JiebaTag::Nr => println!("{}", word.word),
                _ => {}
            }
        }
    }

    pub fn print_company_names(&self) {
        for word in &self.0 {
            match word.tag {
                JiebaTag::Nt => println!("{}", word.word),
                _ => {}
            }
        }
    }
}
