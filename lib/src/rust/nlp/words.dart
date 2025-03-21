// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.8.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'tags.dart';
part 'words.freezed.dart';

@freezed
sealed class Tag with _$Tag {
  const Tag._();

  const factory Tag.wordcut(WordcutTag field0) = Tag_Wordcut;
  const factory Tag.others(OtherTags field0) = Tag_Others;
}

class Word {
  final String word;
  final Tag tag;

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
