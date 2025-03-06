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
          return _WordWithTag(words: words);
        } else {
          return Text('loading');
        }
      },
    );
  }
}

class _WordWithTag extends StatelessWidget {
  const _WordWithTag({required this.words});
  final Words words;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
        child: ListView.separated(
          itemCount: words.field0.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    words.field0[i].word,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    getTagName(tag: words.field0[i].tag),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 5);
          },
        ),
      ),
    );
  }
}
