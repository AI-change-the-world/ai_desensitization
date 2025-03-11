use std::collections::HashMap;

use once_cell::sync::Lazy;

use crate::nlp::jieba_tag::JiebaTag;

use super::{utils::convert_place_name, words::Words};

static SURNAMES: Lazy<Vec<&str>> = Lazy::new(|| {
    let mut v = vec![
        "赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩",
        "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张", "孔", "曹", "严", "华", "金", "魏",
        "陶", "姜", "戚", "谢", "邹", "喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚",
        "范", "彭", "郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁", "柳",
        "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺", "倪", "汤", "滕", "殷", "罗",
        "毕", "郝", "邬", "安", "常", "乐", "于", "时", "傅", "皮", "卞", "齐", "康", "伍", "余",
        "元", "卜", "顾", "孟", "平", "黄", "和", "穆", "萧", "尹", "姚", "邵", "湛", "汪", "祁",
        "毛", "禹", "狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋", "茅", "庞",
        "熊", "纪", "舒", "屈", "项", "祝", "董", "梁", "杜", "阮", "蓝", "闵", "席", "季", "麻",
        "强", "贾", "路", "娄", "危", "江", "童", "颜", "郭", "梅", "盛", "林", "刁", "钟", "徐",
        "邱", "骆", "高", "夏", "蔡", "田", "樊", "胡", "凌", "霍", "虞", "万", "支", "柯", "昝",
        "管", "卢", "莫", "经", "房", "裘", "缪", "干", "解", "应", "宗", "丁", "宣", "贲", "邓",
        "郁", "单", "杭", "洪", "包", "诸", "左", "石", "崔", "吉", "钮", "龚", "程", "嵇", "邢",
        "滑", "裴", "陆", "荣", "翁", "荀", "羊", "於", "惠", "甄", "曲", "家", "封", "芮", "羿",
        "储", "靳", "汲", "邴", "糜", "松", "井", "段", "富", "巫", "乌", "焦", "巴", "弓", "牧",
        "隗", "山", "谷", "车", "侯", "宓", "蓬", "全", "郗", "班", "仰", "秋", "仲", "伊", "宫",
        "宁", "仇", "栾", "暴", "甘", "钭", "厉", "戎", "祖", "武", "符", "刘", "景", "詹", "束",
        "龙", "叶", "幸", "司", "韶", "郜", "黎", "蓟", "薄", "印", "宿", "白", "怀", "蒲", "邰",
        "从", "鄂", "索", "咸", "籍", "赖", "卓", "蔺", "屠", "蒙", "池", "乔", "阴", "鬱", "胥",
        "能", "苍", "双", "闻", "莘", "党", "翟", "谭", "贡", "劳", "逄", "姬", "申", "扶", "堵",
        "冉", "宰", "郦", "雍", "郤", "璩", "桑", "桂", "濮", "牛", "寿", "通", "边", "扈", "燕",
        "冀", "郏", "浦", "尚", "农", "温", "别", "庄", "晏", "柴", "瞿", "阎", "充", "慕", "连",
        "茹", "习", "宦", "艾", "鱼", "容", "向", "古", "易", "慎", "戈", "廖", "庾", "终", "暨",
        "居", "衡", "步", "都", "耿", "满", "弘", "匡", "国", "文", "寇", "广", "禄", "阙", "东",
        "欧", "殳", "沃", "利", "蔚", "越", "夔", "隆", "师", "巩", "厍", "聂", "晁", "勾", "敖",
        "融", "冷", "訾", "辛", "阚", "那", "简", "饶", "空", "曾", "毋", "沙", "乜", "养", "鞠",
        "须", "丰", "巢", "关", "蒯", "相", "查", "后", "荆", "红", "游", "竺", "权", "逯", "盖",
        "益", "桓", "公", "万俟", "司马", "上官", "欧阳", "夏侯", "诸葛", "闻人", "东方", "赫连",
        "皇甫", "尉迟", "公羊", "澹台", "公冶", "宗政", "濮阳", "淳于", "单于", "太叔", "申屠",
        "公孙", "仲孙", "轩辕", "令狐", "钟离", "宇文", "长孙", "慕容", "鲜于", "闾丘", "司徒",
        "司空", "丌官", "司寇", "仉督", "子车", "颛孙", "端木", "巫马", "公西", "漆雕", "乐正",
        "壤驷", "公良", "拓跋", "夹谷", "宰父", "谷梁", "晋", "楚", "闫", "法", "汝", "鄢", "涂",
        "钦", "段干", "百里", "东郭", "南门", "呼延", "归海", "羊舌", "微生", "岳", "帅", "缑",
        "亢", "况", "郈", "有琴", "梁丘", "左丘", "东门", "西门", "商牟", "佘", "佴", "伯赏",
        "南宫", "墨", "哈", "谯", "笪", "年", "爱", "阳", "佟", "第五", "言福",
    ];
    v.sort_by_key(|&x| -(x.len() as i32));
    v
});

static MASKS: Lazy<Vec<&str>> =
    Lazy::new(|| vec!["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]);

fn split_surname(name: &str) -> Option<(&str, &str)> {
    for &surname in SURNAMES.iter() {
        if name.starts_with(surname) {
            let remaining = &name[surname.len()..];
            return Some((surname, remaining));
        }
    }
    None
}

fn get_suffix(n: usize) -> String {
    if n == 0 {
        String::new()
    } else if n <= MASKS.len() {
        MASKS[n - 1].to_string()
    } else {
        format!("{}", n)
    }
}

fn mask_name(
    name: String,
    names: &HashMap<String, (/*姓*/ String, /*姓名*/ String)>,
) -> Option<(String, String)> {
    if names.contains_key(&name) {
        return Some(names.get(&name).unwrap().clone());
    }
    let s = split_surname(&name);

    if let Some((surname, given)) = s {
        let mut count = 0;
        for v in names.values() {
            if v.0 == surname {
                count += 1;
            }
        }
        let masked_given = "某".repeat(given.chars().count());
        let result = if count > 1 {
            let suffix = get_suffix(count);
            format!("{}{}{}", surname, masked_given, suffix)
        } else {
            format!("{}{}", surname, masked_given)
        };
        return Some((surname.to_owned(), result));
    }

    None
}

impl Words {
    pub fn wordcut_mask(&mut self, i18n: String) -> String {
        match i18n.as_str() {
            "zh_cn" => {
                let mut names: HashMap<String, (String, String)> = HashMap::new();
                let mut companies: HashMap<String, String> = HashMap::new();
                let mut places: HashMap<String, String> = HashMap::new();

                for word in self.0.iter_mut() {
                    if word.tag == JiebaTag::Nr {
                        if names.contains_key(&word.word) {
                            word.word = names.get(&word.word).unwrap().clone().1;
                            continue;
                        }
                        let r = mask_name(word.word.clone(), &names);
                        if let Some((surname, masked_name)) = r {
                            word.word = masked_name.clone();
                            names.insert(word.word.clone(), (surname.to_owned(), masked_name));
                        }
                    }
                    if word.tag == JiebaTag::Nt {
                        if companies.contains_key(&word.word) {
                            word.word = companies.get(&word.word).unwrap().clone();
                            continue;
                        }
                        word.word = "某公司".to_owned();
                        companies.insert(word.word.clone(), word.word.clone());
                    }
                    if word.tag == JiebaTag::Ns {
                        if places.contains_key(&word.word) {
                            word.word = places.get(&word.word).unwrap().clone();
                            continue;
                        }
                        word.word = convert_place_name(&word.word);
                        places.insert(word.word.clone(), word.word.clone());
                    }
                }
            }
            _ => {}
        }

        self.join("")
    }

    pub fn wordcut_mask_with_tags(&mut self, i18n: String) -> Words {
        match i18n.as_str() {
            "zh_cn" => {
                let mut names: HashMap<String, (String, String)> = HashMap::new();
                let mut companies: HashMap<String, String> = HashMap::new();
                let mut places: HashMap<String, String> = HashMap::new();

                for word in self.0.iter_mut() {
                    if word.tag == JiebaTag::Nr {
                        if names.contains_key(&word.word) {
                            word.word = names.get(&word.word).unwrap().clone().1;
                            continue;
                        }
                        let r = mask_name(word.word.clone(), &names);
                        if let Some((surname, masked_name)) = r {
                            word.word = masked_name.clone();
                            names.insert(word.word.clone(), (surname.to_owned(), masked_name));
                        }
                    }
                    if word.tag == JiebaTag::Nt {
                        if companies.contains_key(&word.word) {
                            word.word = companies.get(&word.word).unwrap().clone();
                            continue;
                        }
                        word.word = "某公司".to_owned();
                        companies.insert(word.word.clone(), word.word.clone());
                    }
                    if word.tag == JiebaTag::Ns {
                        if places.contains_key(&word.word) {
                            word.word = places.get(&word.word).unwrap().clone();
                            continue;
                        }
                        word.word = convert_place_name(&word.word);
                        places.insert(word.word.clone(), word.word.clone());
                    }
                }
            }
            _ => {}
        }
        self.clone()
    }
}
