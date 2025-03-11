import 'package:ai_desensitization/src/components/rule/_word_with_tag.dart';
import 'package:ai_desensitization/src/rust/api/nlp.dart';
import 'package:ai_desensitization/src/rust/nlp/words.dart';
import 'package:ai_desensitization/src/utils/logger.dart';
import 'package:flutter/material.dart';

class WordDesensitization extends StatefulWidget {
  const WordDesensitization({
    super.key,
    required this.text,
    required this.type,
    required this.params,
    // 0 replace, 1 mask, 2 remove
    this.desensitizationType = 0,
  });
  final String text;
  final int type;
  final List<String> params;
  final int desensitizationType;

  @override
  State<WordDesensitization> createState() => _WordDesensitizationState();
}

class _WordDesensitizationState extends State<WordDesensitization> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  Widget build(BuildContext context) {
    logger.d("repaint");
    if (widget.type != 0 && widget.params.isEmpty) {
      return SizedBox(
        height: 40,
        child: Center(child: Text('Pattern is empty')),
      );
    }

    if (widget.desensitizationType == 0) {
      future = replaceEntitiesWithTags(
        text: widget.text,
        cfg: OperationConfig(
          i18N: "zh_cn",
          type: BigInt.from(widget.type),
          params: widget.params,
        ),
      );
    } else if (widget.desensitizationType == 1) {
      future = maskEntitiesWithTags(
        text: widget.text,
        cfg: OperationConfig(
          i18N: "zh_cn",
          type: BigInt.from(widget.type),
          params: widget.params,
        ),
      );
    } else {
      future = removeEntitiesWithTags(
        text: widget.text,
        cfg: OperationConfig(
          i18N: "zh_cn",
          type: BigInt.from(widget.type),
          params: widget.params,
        ),
      );
    }
    return FutureBuilder(
      future: future,
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          final res = s.data;
          return WordWithTagWidget(
            words: res as Words,
            showIcon: false,
            onDelete: () {},
          );
        } else {
          return SizedBox(height: 40, child: Center(child: Text('loading')));
        }
      },
    );
  }
}
