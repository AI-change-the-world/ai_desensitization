// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.8.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../nlp/jieba_tag.dart';
import '../nlp/words.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<Words> getWordSegResult({required String text}) =>
    RustLib.instance.api.crateApiNlpGetWordSegResult(text: text);

Future<String> replaceEntities({required String text, required String i18N}) =>
    RustLib.instance.api.crateApiNlpReplaceEntities(text: text, i18N: i18N);

Future<Words> replaceEntitiesWithTags({
  required String text,
  required String i18N,
}) => RustLib.instance.api.crateApiNlpReplaceEntitiesWithTags(
  text: text,
  i18N: i18N,
);

String getTagName({required JiebaTag tag}) =>
    RustLib.instance.api.crateApiNlpGetTagName(tag: tag);

void addSegmentWord({
  required String word,
  required BigInt freq,
  required String tag,
}) => RustLib.instance.api.crateApiNlpAddSegmentWord(
  word: word,
  freq: freq,
  tag: tag,
);
