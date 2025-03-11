import 'package:ai_desensitization/src/rust/api/nlp.dart';
import 'package:ai_desensitization/src/rust/nlp/words.dart';
import 'package:flutter/material.dart';

class WordWithTagWidget extends StatefulWidget {
  const WordWithTagWidget({
    super.key,
    required this.words,
    required this.onDelete,
    this.showIcon = true,
  });
  final Words words;
  final VoidCallback onDelete;
  final bool showIcon;

  @override
  State<WordWithTagWidget> createState() => _WordWithTagWidgetState();
}

class _WordWithTagWidgetState extends State<WordWithTagWidget> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovering = false;
        });
      },
      child: Material(
        elevation: 3,
        child: Stack(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
              child: ListView.separated(
                itemCount: widget.words.field0.length,
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
                          widget.words.field0[i].word,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          getTagName(tag: widget.words.field0[i].tag),
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
            if (hovering && widget.showIcon)
              Positioned(
                top: 8,
                right: 5,
                child: InkWell(
                  onTap: () {
                    widget.onDelete();
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: Icon(Icons.delete, color: Colors.red, size: 15),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
