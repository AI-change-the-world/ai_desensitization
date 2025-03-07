import 'package:ai_desensitization/src/components/rule/_word_with_tag.dart';
import 'package:ai_desensitization/src/rust/api/nlp.dart';
import 'package:ai_desensitization/src/rust/nlp/words.dart';
import 'package:flutter/material.dart';

class WordReplace extends StatefulWidget {
  const WordReplace({super.key, required this.text});
  final String text;

  @override
  State<WordReplace> createState() => _WordReplaceState();
}

class _WordReplaceState extends State<WordReplace> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future = replaceEntitiesWithTags(text: widget.text, i18N: "zh_cn");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          final res = s.data;
          return WordWithTagWidget(words: res as Words);
        } else {
          return SizedBox(height: 40, child: Text('loading'));
        }
      },
    );
  }
}
