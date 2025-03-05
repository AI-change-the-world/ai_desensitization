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
        let address = "广东省深圳市南山区科技园南区";
        let words = jieba.cut(address, false);
        println!("{:?}", words);
    }
}
