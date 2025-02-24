// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_db.dart';

// ignore_for_file: type=lint
class $DriftQrTable extends DriftQr with TableInfo<$DriftQrTable, DriftQrData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftQrTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_qr';
  @override
  VerificationContext validateIntegrity(
    Insertable<DriftQrData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftQrData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftQrData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      value:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}value'],
          )!,
    );
  }

  @override
  $DriftQrTable createAlias(String alias) {
    return $DriftQrTable(attachedDatabase, alias);
  }
}

class DriftQrData extends DataClass implements Insertable<DriftQrData> {
  final int id;
  final String name;
  final String value;
  const DriftQrData({
    required this.id,
    required this.name,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value'] = Variable<String>(value);
    return map;
  }

  DriftQrCompanion toCompanion(bool nullToAbsent) {
    return DriftQrCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value),
    );
  }

  factory DriftQrData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftQrData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
    };
  }

  DriftQrData copyWith({int? id, String? name, String? value}) => DriftQrData(
    id: id ?? this.id,
    name: name ?? this.name,
    value: value ?? this.value,
  );
  DriftQrData copyWithCompanion(DriftQrCompanion data) {
    return DriftQrData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftQrData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftQrData &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value);
}

class DriftQrCompanion extends UpdateCompanion<DriftQrData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> value;
  const DriftQrCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  DriftQrCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String value,
  }) : name = Value(name),
       value = Value(value);
  static Insertable<DriftQrData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  DriftQrCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? value,
  }) {
    return DriftQrCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftQrCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftQrDataBase extends GeneratedDatabase {
  _$DriftQrDataBase(QueryExecutor e) : super(e);
  $DriftQrDataBaseManager get managers => $DriftQrDataBaseManager(this);
  late final $DriftQrTable driftQr = $DriftQrTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftQr];
}

typedef $$DriftQrTableCreateCompanionBuilder =
    DriftQrCompanion Function({
      Value<int> id,
      required String name,
      required String value,
    });
typedef $$DriftQrTableUpdateCompanionBuilder =
    DriftQrCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> value,
    });

class $$DriftQrTableFilterComposer
    extends Composer<_$DriftQrDataBase, $DriftQrTable> {
  $$DriftQrTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DriftQrTableOrderingComposer
    extends Composer<_$DriftQrDataBase, $DriftQrTable> {
  $$DriftQrTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DriftQrTableAnnotationComposer
    extends Composer<_$DriftQrDataBase, $DriftQrTable> {
  $$DriftQrTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$DriftQrTableTableManager
    extends
        RootTableManager<
          _$DriftQrDataBase,
          $DriftQrTable,
          DriftQrData,
          $$DriftQrTableFilterComposer,
          $$DriftQrTableOrderingComposer,
          $$DriftQrTableAnnotationComposer,
          $$DriftQrTableCreateCompanionBuilder,
          $$DriftQrTableUpdateCompanionBuilder,
          (
            DriftQrData,
            BaseReferences<_$DriftQrDataBase, $DriftQrTable, DriftQrData>,
          ),
          DriftQrData,
          PrefetchHooks Function()
        > {
  $$DriftQrTableTableManager(_$DriftQrDataBase db, $DriftQrTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DriftQrTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DriftQrTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DriftQrTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> value = const Value.absent(),
              }) => DriftQrCompanion(id: id, name: name, value: value),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String value,
              }) => DriftQrCompanion.insert(id: id, name: name, value: value),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DriftQrTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftQrDataBase,
      $DriftQrTable,
      DriftQrData,
      $$DriftQrTableFilterComposer,
      $$DriftQrTableOrderingComposer,
      $$DriftQrTableAnnotationComposer,
      $$DriftQrTableCreateCompanionBuilder,
      $$DriftQrTableUpdateCompanionBuilder,
      (
        DriftQrData,
        BaseReferences<_$DriftQrDataBase, $DriftQrTable, DriftQrData>,
      ),
      DriftQrData,
      PrefetchHooks Function()
    >;

class $DriftQrDataBaseManager {
  final _$DriftQrDataBase _db;
  $DriftQrDataBaseManager(this._db);
  $$DriftQrTableTableManager get driftQr =>
      $$DriftQrTableTableManager(_db, _db.driftQr);
}
