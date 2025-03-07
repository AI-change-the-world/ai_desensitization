// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.8.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'jieba_tag.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class Word {
  final String word;
  final JiebaTag tag;

  const Word({required this.word, required this.tag});

  @override
  int get hashCode => word.hashCode ^ tag.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          tag == other.tag;
}

class Words {
  final List<Word> field0;

  const Words({required this.field0});

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Words &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}
