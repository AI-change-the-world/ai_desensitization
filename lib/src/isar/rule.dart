// ignore_for_file: constant_identifier_names

import 'package:isar/isar.dart';

part 'rule.g.dart';

enum EntityType {
  PII('PII'),
  organization('organization'),
  location('location'),
  others('others');

  final String name;

  const EntityType(this.name);
}

enum RuleType {
  wordcut('wordcut'),
  regex('regex'),
  keyword('keyword'),
  fuzzy('fuzzy');

  final String name;

  const RuleType(this.name);
}

extension GetIndex on RuleType {
  int get order {
    switch (this) {
      case RuleType.wordcut:
        return 0;
      case RuleType.regex:
        return 2;
      case RuleType.keyword:
        return 1;
      case RuleType.fuzzy:
        return 3;
    }
  }
}

enum DesensitizationFunc {
  replace('replace'),
  mask('mask'),
  remove('remove');

  final String name;

  const DesensitizationFunc(this.name);
}

extension GetIndex2 on DesensitizationFunc {
  int get order {
    switch (this) {
      case DesensitizationFunc.replace:
        return 0;
      case DesensitizationFunc.mask:
        return 1;
      case DesensitizationFunc.remove:
        return 2;
    }
  }
}

@collection
class Rule {
  Id id = Isar.autoIncrement;

  @enumerated
  EntityType entityType = EntityType.others;

  @enumerated
  RuleType ruleType = RuleType.keyword;

  @enumerated
  DesensitizationFunc desensitizationFunc = DesensitizationFunc.mask;

  String? ruleName;
  String? description;
  // keyword, regex, fuzzy
  String? content;
  // replace, mask, remove
  String? replacement;
}
