// ignore_for_file: constant_identifier_names

import 'package:isar/isar.dart';

part 'rule.g.dart';

enum EntityType {
  PII('PII'),
  organization('organization'),
  location('location'),
  others('others');

  final String message;

  const EntityType(this.message);
}

enum RuleType {
  regex('regex'),
  keyword('keyword'),
  fuzzy('fuzzy');

  final String message;

  const RuleType(this.message);
}

enum DesensitizationFunc {
  replace('replace'),
  mask('mask'),
  remove('remove');

  final String message;

  const DesensitizationFunc(this.message);
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
