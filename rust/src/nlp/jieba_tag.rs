#[derive(Debug, Clone)]
pub enum JiebaTag {
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

impl JiebaTag {
    pub fn as_str(&self) -> &str {
        match self {
            JiebaTag::N => "n",
            JiebaTag::Nr => "nr",
            JiebaTag::Ns => "ns",
            JiebaTag::Nt => "nt",
            JiebaTag::Nz => "nz",
            JiebaTag::V => "v",
            JiebaTag::Vd => "vd",
            JiebaTag::Vn => "vn",
            JiebaTag::A => "a",
            JiebaTag::Ad => "ad",
            JiebaTag::An => "an",
            JiebaTag::D => "d",
            JiebaTag::Dg => "dg",
            JiebaTag::R => "r",
            JiebaTag::Rr => "rr",
            JiebaTag::Rz => "rz",
            JiebaTag::M => "m",
            JiebaTag::Mq => "mq",
            JiebaTag::Q => "q",
            JiebaTag::P => "p",
            JiebaTag::C => "c",
            JiebaTag::U => "u",
            JiebaTag::Ug => "ug",
            JiebaTag::Us => "us",
            JiebaTag::E => "e",
            JiebaTag::O => "o",
            JiebaTag::S => "s",
            JiebaTag::X(_s) => _s,
        }
    }

    pub fn get_description(&self) -> &str {
        match self {
            JiebaTag::N => "名词",
            JiebaTag::Nr => "人名",
            JiebaTag::Ns => "地名",
            JiebaTag::Nt => "组织机构名",
            JiebaTag::Nz => "其他专有名词",
            JiebaTag::V => "动词",
            JiebaTag::Vd => "副动词",
            JiebaTag::Vn => "名动词",
            JiebaTag::A => "形容词",
            JiebaTag::Ad => "副形容词",
            JiebaTag::An => "名形容词",
            JiebaTag::D => "副词",
            JiebaTag::Dg => "副形副词",
            JiebaTag::R => "代词",
            JiebaTag::Rr => "人称代词",
            JiebaTag::Rz => "指示代词",
            JiebaTag::M => "数词",
            JiebaTag::Mq => "数量词",
            JiebaTag::Q => "量词",
            JiebaTag::P => "介词",
            JiebaTag::C => "连词",
            JiebaTag::U => "助词",
            JiebaTag::Ug => "语气助词",
            JiebaTag::Us => "结构助词",
            JiebaTag::E => "叹词",
            JiebaTag::O => "拟声词",
            JiebaTag::S => "符号",
            JiebaTag::X(_) => "其他",
        }
    }
}
