// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRuleCollection on Isar {
  IsarCollection<Rule> get rules => this.collection();
}

const RuleSchema = CollectionSchema(
  name: r'Rule',
  id: -2659006343538057288,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'desensitizationFunc': PropertySchema(
      id: 2,
      name: r'desensitizationFunc',
      type: IsarType.byte,
      enumMap: _RuledesensitizationFuncEnumValueMap,
    ),
    r'entityType': PropertySchema(
      id: 3,
      name: r'entityType',
      type: IsarType.byte,
      enumMap: _RuleentityTypeEnumValueMap,
    ),
    r'replacement': PropertySchema(
      id: 4,
      name: r'replacement',
      type: IsarType.string,
    ),
    r'ruleName': PropertySchema(
      id: 5,
      name: r'ruleName',
      type: IsarType.string,
    ),
    r'ruleType': PropertySchema(
      id: 6,
      name: r'ruleType',
      type: IsarType.byte,
      enumMap: _RuleruleTypeEnumValueMap,
    )
  },
  estimateSize: _ruleEstimateSize,
  serialize: _ruleSerialize,
  deserialize: _ruleDeserialize,
  deserializeProp: _ruleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ruleGetId,
  getLinks: _ruleGetLinks,
  attach: _ruleAttach,
  version: '3.1.0+1',
);

int _ruleEstimateSize(
  Rule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.replacement;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ruleSerialize(
  Rule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeString(offsets[1], object.description);
  writer.writeByte(offsets[2], object.desensitizationFunc.index);
  writer.writeByte(offsets[3], object.entityType.index);
  writer.writeString(offsets[4], object.replacement);
  writer.writeString(offsets[5], object.ruleName);
  writer.writeByte(offsets[6], object.ruleType.index);
}

Rule _ruleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Rule();
  object.content = reader.readStringOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.desensitizationFunc =
      _RuledesensitizationFuncValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          DesensitizationFunc.replace;
  object.entityType =
      _RuleentityTypeValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          EntityType.PII;
  object.id = id;
  object.replacement = reader.readStringOrNull(offsets[4]);
  object.ruleName = reader.readStringOrNull(offsets[5]);
  object.ruleType =
      _RuleruleTypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          RuleType.regex;
  return object;
}

P _ruleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (_RuledesensitizationFuncValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DesensitizationFunc.replace) as P;
    case 3:
      return (_RuleentityTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          EntityType.PII) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_RuleruleTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          RuleType.regex) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RuledesensitizationFuncEnumValueMap = {
  'replace': 0,
  'mask': 1,
  'remove': 2,
};
const _RuledesensitizationFuncValueEnumMap = {
  0: DesensitizationFunc.replace,
  1: DesensitizationFunc.mask,
  2: DesensitizationFunc.remove,
};
const _RuleentityTypeEnumValueMap = {
  'PII': 0,
  'organization': 1,
  'location': 2,
  'others': 3,
};
const _RuleentityTypeValueEnumMap = {
  0: EntityType.PII,
  1: EntityType.organization,
  2: EntityType.location,
  3: EntityType.others,
};
const _RuleruleTypeEnumValueMap = {
  'regex': 0,
  'keyword': 1,
  'fuzzy': 2,
};
const _RuleruleTypeValueEnumMap = {
  0: RuleType.regex,
  1: RuleType.keyword,
  2: RuleType.fuzzy,
};

Id _ruleGetId(Rule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ruleGetLinks(Rule object) {
  return [];
}

void _ruleAttach(IsarCollection<dynamic> col, Id id, Rule object) {
  object.id = id;
}

extension RuleQueryWhereSort on QueryBuilder<Rule, Rule, QWhere> {
  QueryBuilder<Rule, Rule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RuleQueryWhere on QueryBuilder<Rule, Rule, QWhereClause> {
  QueryBuilder<Rule, Rule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Rule, Rule, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Rule, Rule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Rule, Rule, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RuleQueryFilter on QueryBuilder<Rule, Rule, QFilterCondition> {
  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> desensitizationFuncEqualTo(
      DesensitizationFunc value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desensitizationFunc',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition>
      desensitizationFuncGreaterThan(
    DesensitizationFunc value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desensitizationFunc',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> desensitizationFuncLessThan(
    DesensitizationFunc value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desensitizationFunc',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> desensitizationFuncBetween(
    DesensitizationFunc lower,
    DesensitizationFunc upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desensitizationFunc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> entityTypeEqualTo(
      EntityType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> entityTypeGreaterThan(
    EntityType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> entityTypeLessThan(
    EntityType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> entityTypeBetween(
    EntityType lower,
    EntityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'replacement',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'replacement',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'replacement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'replacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'replacement',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replacement',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> replacementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'replacement',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleTypeEqualTo(
      RuleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleTypeGreaterThan(
    RuleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleTypeLessThan(
    RuleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleType',
        value: value,
      ));
    });
  }

  QueryBuilder<Rule, Rule, QAfterFilterCondition> ruleTypeBetween(
    RuleType lower,
    RuleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RuleQueryObject on QueryBuilder<Rule, Rule, QFilterCondition> {}

extension RuleQueryLinks on QueryBuilder<Rule, Rule, QFilterCondition> {}

extension RuleQuerySortBy on QueryBuilder<Rule, Rule, QSortBy> {
  QueryBuilder<Rule, Rule, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByDesensitizationFunc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desensitizationFunc', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByDesensitizationFuncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desensitizationFunc', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByReplacement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacement', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByReplacementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacement', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByRuleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleType', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> sortByRuleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleType', Sort.desc);
    });
  }
}

extension RuleQuerySortThenBy on QueryBuilder<Rule, Rule, QSortThenBy> {
  QueryBuilder<Rule, Rule, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByDesensitizationFunc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desensitizationFunc', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByDesensitizationFuncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desensitizationFunc', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByReplacement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacement', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByReplacementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacement', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByRuleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleType', Sort.asc);
    });
  }

  QueryBuilder<Rule, Rule, QAfterSortBy> thenByRuleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleType', Sort.desc);
    });
  }
}

extension RuleQueryWhereDistinct on QueryBuilder<Rule, Rule, QDistinct> {
  QueryBuilder<Rule, Rule, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByDesensitizationFunc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desensitizationFunc');
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType');
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByReplacement(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'replacement', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByRuleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Rule, Rule, QDistinct> distinctByRuleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleType');
    });
  }
}

extension RuleQueryProperty on QueryBuilder<Rule, Rule, QQueryProperty> {
  QueryBuilder<Rule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Rule, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<Rule, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Rule, DesensitizationFunc, QQueryOperations>
      desensitizationFuncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desensitizationFunc');
    });
  }

  QueryBuilder<Rule, EntityType, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<Rule, String?, QQueryOperations> replacementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'replacement');
    });
  }

  QueryBuilder<Rule, String?, QQueryOperations> ruleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleName');
    });
  }

  QueryBuilder<Rule, RuleType, QQueryOperations> ruleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleType');
    });
  }
}
