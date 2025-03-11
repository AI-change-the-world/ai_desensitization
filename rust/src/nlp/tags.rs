#[derive(Debug, Clone, PartialEq, Eq)]
pub enum OtherTags {
    Regex,
    Keyword,
    Other,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum WordcutTag {
    N,         // 名词
    Nr,        // 人名
    Ns,        // 地名
    Nt,        // 组织机构名
    Nz,        // 其他专有名词
    V,         // 动词
    Vd,        // 副动词
    Vn,        // 名动词
    A,         // 形容词
    Ad,        // 副形容词
    An,        // 名形容词
    D,         // 副词
    Dg,        // 副形副词
    R,         // 代词
    Rr,        // 人称代词
    Rz,        // 指示代词
    M,         // 数词
    Mq,        // 数量词
    Q,         // 量词
    P,         // 介词
    C,         // 连词
    U,         // 助词
    Ug,        // 语气助词
    Us,        // 结构助词
    E,         // 叹词
    O,         // 拟声词
    S,         // 符号
    X(String), // 其他
}

impl WordcutTag {
    pub fn as_str(&self) -> &str {
        match self {
            WordcutTag::N => "n",
            WordcutTag::Nr => "nr",
            WordcutTag::Ns => "ns",
            WordcutTag::Nt => "nt",
            WordcutTag::Nz => "nz",
            WordcutTag::V => "v",
            WordcutTag::Vd => "vd",
            WordcutTag::Vn => "vn",
            WordcutTag::A => "a",
            WordcutTag::Ad => "ad",
            WordcutTag::An => "an",
            WordcutTag::D => "d",
            WordcutTag::Dg => "dg",
            WordcutTag::R => "r",
            WordcutTag::Rr => "rr",
            WordcutTag::Rz => "rz",
            WordcutTag::M => "m",
            WordcutTag::Mq => "mq",
            WordcutTag::Q => "q",
            WordcutTag::P => "p",
            WordcutTag::C => "c",
            WordcutTag::U => "u",
            WordcutTag::Ug => "ug",
            WordcutTag::Us => "us",
            WordcutTag::E => "e",
            WordcutTag::O => "o",
            WordcutTag::S => "s",
            WordcutTag::X(_s) => _s,
        }
    }

    pub fn get_description(&self) -> &str {
        match self {
            WordcutTag::N => "名词",
            WordcutTag::Nr => "人名",
            WordcutTag::Ns => "地名",
            WordcutTag::Nt => "组织机构名",
            WordcutTag::Nz => "其他专有名词",
            WordcutTag::V => "动词",
            WordcutTag::Vd => "副动词",
            WordcutTag::Vn => "名动词",
            WordcutTag::A => "形容词",
            WordcutTag::Ad => "副形容词",
            WordcutTag::An => "名形容词",
            WordcutTag::D => "副词",
            WordcutTag::Dg => "副形副词",
            WordcutTag::R => "代词",
            WordcutTag::Rr => "人称代词",
            WordcutTag::Rz => "指示代词",
            WordcutTag::M => "数词",
            WordcutTag::Mq => "数量词",
            WordcutTag::Q => "量词",
            WordcutTag::P => "介词",
            WordcutTag::C => "连词",
            WordcutTag::U => "助词",
            WordcutTag::Ug => "语气助词",
            WordcutTag::Us => "结构助词",
            WordcutTag::E => "叹词",
            WordcutTag::O => "拟声词",
            WordcutTag::S => "符号",
            WordcutTag::X(_) => "其他",
        }
    }
}
