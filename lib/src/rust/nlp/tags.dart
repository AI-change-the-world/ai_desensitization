// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.8.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'tags.freezed.dart';

enum OtherTags { regex, keyword, other }

@freezed
sealed class WordcutTag with _$WordcutTag {
  const WordcutTag._();

  const factory WordcutTag.n() = WordcutTag_N;
  const factory WordcutTag.nr() = WordcutTag_Nr;
  const factory WordcutTag.ns() = WordcutTag_Ns;
  const factory WordcutTag.nt() = WordcutTag_Nt;
  const factory WordcutTag.nz() = WordcutTag_Nz;
  const factory WordcutTag.v() = WordcutTag_V;
  const factory WordcutTag.vd() = WordcutTag_Vd;
  const factory WordcutTag.vn() = WordcutTag_Vn;
  const factory WordcutTag.a() = WordcutTag_A;
  const factory WordcutTag.ad() = WordcutTag_Ad;
  const factory WordcutTag.an() = WordcutTag_An;
  const factory WordcutTag.d() = WordcutTag_D;
  const factory WordcutTag.dg() = WordcutTag_Dg;
  const factory WordcutTag.r() = WordcutTag_R;
  const factory WordcutTag.rr() = WordcutTag_Rr;
  const factory WordcutTag.rz() = WordcutTag_Rz;
  const factory WordcutTag.m() = WordcutTag_M;
  const factory WordcutTag.mq() = WordcutTag_Mq;
  const factory WordcutTag.q() = WordcutTag_Q;
  const factory WordcutTag.p() = WordcutTag_P;
  const factory WordcutTag.c() = WordcutTag_C;
  const factory WordcutTag.u() = WordcutTag_U;
  const factory WordcutTag.ug() = WordcutTag_Ug;
  const factory WordcutTag.us() = WordcutTag_Us;
  const factory WordcutTag.e() = WordcutTag_E;
  const factory WordcutTag.o() = WordcutTag_O;
  const factory WordcutTag.s() = WordcutTag_S;
  const factory WordcutTag.x(String field0) = WordcutTag_X;
}
