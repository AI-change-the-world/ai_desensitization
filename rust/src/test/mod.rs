#[cfg(test)]
mod tests {
    use jieba_rs::Jieba;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn test_jieba() {
        let jieba = Jieba::new();
        let address = "广东省深圳市南山区科技园南区,是一个有意思的科技园区。";
        let words = jieba.cut(address, false);
        println!("{:?}", words);
        let words = jieba.tag(address, false);
        println!("{:?}", words);
        let words = jieba.tag(&"张三丰", false);
        println!("{:?}", words);
        let words = jieba.tag(&"words", false);
        println!("{:?}", words);
    }
}
