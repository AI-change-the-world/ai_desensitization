import 'package:ai_desensitization/src/rust/api/nlp.dart';
import 'package:ai_desensitization/src/rust/nlp/words.dart';
import 'package:flutter/material.dart';

class WordWithTagWidget extends StatelessWidget {
  const WordWithTagWidget({super.key, required this.words});
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
