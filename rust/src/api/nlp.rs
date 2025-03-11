use flutter_rust_bridge::frb;

use crate::nlp::{
    jieba_tag::JiebaTag,
    words::{add_word, Words},
};

pub fn get_word_seg_result(text: String) -> Words {
    Words::from_str_with_wordcut(&text)
}

pub fn replace_entities(text: String, i18n: String) -> String {
    let mut words = Words::from_str_with_wordcut(&text);
    words.wordcut_replace(i18n)
}

pub fn replace_entities_with_tags(text: String, i18n: String) -> Words {
    let mut words = Words::from_str_with_wordcut(&text);
    words.wordcut_replace_with_tag(i18n)
}

pub fn mask_entities(text: String, i18n: String) -> String {
    let mut words = Words::from_str_with_wordcut(&text);
    words.wordcut_mask(i18n)
}

pub fn mask_entities_with_tags(text: String, i18n: String) -> Words {
    let mut words = Words::from_str_with_wordcut(&text);
    words.wordcut_mask_with_tags(i18n)
}

#[frb(sync)]
pub fn get_tag_name(tag: JiebaTag) -> String {
    tag.as_str().to_string()
}

#[frb(sync)]
pub fn add_segment_word(word: String, freq: usize, tag: String) {
    add_word(&word, freq, &tag);
}
