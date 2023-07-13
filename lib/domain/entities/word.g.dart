// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordCollection on Isar {
  IsarCollection<Word> get words => this.collection();
}

const WordSchema = CollectionSchema(
  name: r'Word',
  id: 2997905348638732671,
  properties: {
    r'examples': PropertySchema(
      id: 0,
      name: r'examples',
      type: IsarType.objectList,
      target: r'Example',
    ),
    r'ipa': PropertySchema(
      id: 1,
      name: r'ipa',
      type: IsarType.stringList,
    ),
    r'level': PropertySchema(
      id: 2,
      name: r'level',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'sense': PropertySchema(
      id: 4,
      name: r'sense',
      type: IsarType.stringList,
    ),
    r'soundGB': PropertySchema(
      id: 5,
      name: r'soundGB',
      type: IsarType.string,
    ),
    r'soundUS': PropertySchema(
      id: 6,
      name: r'soundUS',
      type: IsarType.string,
    )
  },
  estimateSize: _wordEstimateSize,
  serialize: _wordSerialize,
  deserialize: _wordDeserialize,
  deserializeProp: _wordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Example': ExampleSchema},
  getId: _wordGetId,
  getLinks: _wordGetLinks,
  attach: _wordAttach,
  version: '3.1.0+1',
);

int _wordEstimateSize(
  Word object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.examples.length * 3;
  {
    final offsets = allOffsets[Example]!;
    for (var i = 0; i < object.examples.length; i++) {
      final value = object.examples[i];
      bytesCount += ExampleSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.ipa.length * 3;
  {
    for (var i = 0; i < object.ipa.length; i++) {
      final value = object.ipa[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.sense.length * 3;
  {
    for (var i = 0; i < object.sense.length; i++) {
      final value = object.sense[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.soundGB.length * 3;
  bytesCount += 3 + object.soundUS.length * 3;
  return bytesCount;
}

void _wordSerialize(
  Word object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Example>(
    offsets[0],
    allOffsets,
    ExampleSchema.serialize,
    object.examples,
  );
  writer.writeStringList(offsets[1], object.ipa);
  writer.writeString(offsets[2], object.level);
  writer.writeString(offsets[3], object.name);
  writer.writeStringList(offsets[4], object.sense);
  writer.writeString(offsets[5], object.soundGB);
  writer.writeString(offsets[6], object.soundUS);
}

Word _wordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Word(
    examples: reader.readObjectList<Example>(
          offsets[0],
          ExampleSchema.deserialize,
          allOffsets,
          Example(),
        ) ??
        [],
    ipa: reader.readStringList(offsets[1]) ?? [],
    level: reader.readString(offsets[2]),
    name: reader.readString(offsets[3]),
    sense: reader.readStringList(offsets[4]) ?? [],
    soundGB: reader.readString(offsets[5]),
    soundUS: reader.readString(offsets[6]),
  );
  object.id = id;
  return object;
}

P _wordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Example>(
            offset,
            ExampleSchema.deserialize,
            allOffsets,
            Example(),
          ) ??
          []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wordGetId(Word object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordGetLinks(Word object) {
  return [];
}

void _wordAttach(IsarCollection<dynamic> col, Id id, Word object) {
  object.id = id;
}

extension WordQueryWhereSort on QueryBuilder<Word, Word, QWhere> {
  QueryBuilder<Word, Word, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WordQueryWhere on QueryBuilder<Word, Word, QWhereClause> {
  QueryBuilder<Word, Word, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Word, Word, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idBetween(
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

extension WordQueryFilter on QueryBuilder<Word, Word, QFilterCondition> {
  QueryBuilder<Word, Word, QAfterFilterCondition> examplesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> examplesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> examplesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> examplesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> examplesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> examplesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Word, Word, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Word, Word, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ipa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ipa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ipa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ipa',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ipa',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> ipaLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ipa',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'level',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sense',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sense',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sense',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> senseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sense',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soundGB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soundGB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soundGB',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundGB',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundGBIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soundGB',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soundUS',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soundUS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soundUS',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundUS',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> soundUSIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soundUS',
        value: '',
      ));
    });
  }
}

extension WordQueryObject on QueryBuilder<Word, Word, QFilterCondition> {
  QueryBuilder<Word, Word, QAfterFilterCondition> examplesElement(
      FilterQuery<Example> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'examples');
    });
  }
}

extension WordQueryLinks on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQuerySortBy on QueryBuilder<Word, Word, QSortBy> {
  QueryBuilder<Word, Word, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySoundGB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundGB', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySoundGBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundGB', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySoundUS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundUS', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySoundUSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundUS', Sort.desc);
    });
  }
}

extension WordQuerySortThenBy on QueryBuilder<Word, Word, QSortThenBy> {
  QueryBuilder<Word, Word, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySoundGB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundGB', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySoundGBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundGB', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySoundUS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundUS', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySoundUSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundUS', Sort.desc);
    });
  }
}

extension WordQueryWhereDistinct on QueryBuilder<Word, Word, QDistinct> {
  QueryBuilder<Word, Word, QDistinct> distinctByIpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ipa');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctBySense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sense');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctBySoundGB(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundGB', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctBySoundUS(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundUS', caseSensitive: caseSensitive);
    });
  }
}

extension WordQueryProperty on QueryBuilder<Word, Word, QQueryProperty> {
  QueryBuilder<Word, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Word, List<Example>, QQueryOperations> examplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examples');
    });
  }

  QueryBuilder<Word, List<String>, QQueryOperations> ipaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ipa');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Word, List<String>, QQueryOperations> senseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sense');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> soundGBProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundGB');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> soundUSProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundUS');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExampleSchema = Schema(
  name: r'Example',
  id: 3480277070129081977,
  properties: {
    r'en': PropertySchema(
      id: 0,
      name: r'en',
      type: IsarType.string,
    ),
    r'es': PropertySchema(
      id: 1,
      name: r'es',
      type: IsarType.string,
    )
  },
  estimateSize: _exampleEstimateSize,
  serialize: _exampleSerialize,
  deserialize: _exampleDeserialize,
  deserializeProp: _exampleDeserializeProp,
);

int _exampleEstimateSize(
  Example object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.en;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.es;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _exampleSerialize(
  Example object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.en);
  writer.writeString(offsets[1], object.es);
}

Example _exampleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Example();
  object.en = reader.readStringOrNull(offsets[0]);
  object.es = reader.readStringOrNull(offsets[1]);
  return object;
}

P _exampleDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExampleQueryFilter
    on QueryBuilder<Example, Example, QFilterCondition> {
  QueryBuilder<Example, Example, QAfterFilterCondition> enIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'en',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'en',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> enIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'es',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'es',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'es',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'es',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'es',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'es',
        value: '',
      ));
    });
  }

  QueryBuilder<Example, Example, QAfterFilterCondition> esIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'es',
        value: '',
      ));
    });
  }
}

extension ExampleQueryObject
    on QueryBuilder<Example, Example, QFilterCondition> {}
