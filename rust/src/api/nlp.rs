use flutter_rust_bridge::frb;

use crate::nlp::{
    tags::OtherTags,
    words::{add_word, Tag, Words},
};

pub fn get_word_seg_result(text: String) -> Words {
    Words::from_str_with_wordcut(&text)
}

#[derive(Debug)]
pub struct OperationConfig {
    pub i18n: String,
    // 0 wordcut,1 keyword,2 regex
    pub r#type: usize,
    pub params: Vec<String>,
}

pub fn replace_entities(text: String, cfg: OperationConfig) -> String {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.replace(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.replace(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.replace(cfg.i18n)
        }
    }
}

pub fn replace_entities_with_tags(text: String, cfg: OperationConfig) -> Words {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.replace_with_tag(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.replace_with_tag(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.replace_with_tag(cfg.i18n)
        }
    }
}

pub fn mask_entities(text: String, cfg: OperationConfig) -> String {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.mask(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.mask(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.mask(cfg.i18n)
        }
    }
}

pub fn mask_entities_with_tags(text: String, cfg: OperationConfig) -> Words {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.mask_with_tags(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.mask_with_tags(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.mask_with_tags(cfg.i18n)
        }
    }
}

pub fn remove_entities(text: String, cfg: OperationConfig) -> String {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.remove(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.remove(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.remove(cfg.i18n)
        }
    }
}

pub fn remove_entities_with_tags(text: String, cfg: OperationConfig) -> Words {
    match cfg.r#type {
        1 => {
            let mut words = Words::from_str_with_keywords(&text, cfg.params);
            words.remove_with_tags(cfg.i18n)
        }
        2 => {
            let mut words = Words::from_str_with_regex(&text, cfg.params[0].clone());
            words.remove_with_tags(cfg.i18n)
        }
        _ => {
            let mut words = Words::from_str_with_wordcut(&text);
            words.remove_with_tags(cfg.i18n)
        }
    }
}

#[frb(sync)]
pub fn get_tag_name(tag: Tag) -> String {
    // tag.as_str().to_string()
    match tag {
        Tag::Wordcut(w) => w.as_str().to_string(),
        Tag::Others(o) => match o {
            OtherTags::Keyword => "keyword".to_string(),
            OtherTags::Regex => "regex".to_string(),
            _ => "other".to_string(),
        },
    }
}

#[frb(sync)]
pub fn add_segment_word(word: String, freq: usize, tag: String) {
    add_word(&word, freq, &tag);
}
