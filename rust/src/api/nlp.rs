use flutter_rust_bridge::frb;

use crate::nlp::{jieba_tag::JiebaTag, words::Words};

pub fn get_word_seg_result(text: String) -> Words {
    Words::get_word_with_tag(&text)
}

pub fn replace_entities(text: String, i18n: String) -> String {
    let mut words = Words::get_word_with_tag(&text);
    words.replace(i18n)
}

#[frb(sync)]
pub fn get_tag_name(tag: JiebaTag) -> String {
    tag.as_str().to_string()
}
