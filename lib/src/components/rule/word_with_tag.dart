import 'package:ai_desensitization/src/components/rule/_word_with_tag.dart';
import 'package:ai_desensitization/src/rust/api/nlp.dart';
import 'package:ai_desensitization/src/rust/nlp/words.dart';
import 'package:flutter/material.dart';

class WordWithTag extends StatefulWidget {
  const WordWithTag({super.key, required this.text});
  final String text;

  @override
  State<WordWithTag> createState() => _WordWithTagState();
}

class _WordWithTagState extends State<WordWithTag> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future = getWordSegResult(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          final words = s.data as Words;
          return WordWithTagWidget(words: words);
        } else {
          return Text('loading');
        }
      },
    );
  }
}
