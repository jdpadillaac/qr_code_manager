// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// ignore_for_file: type=lint
class $DriftUserTable extends DriftUser
    with TableInfo<$DriftUserTable, DriftUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftUserTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userName, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_user';
  @override
  VerificationContext validateIntegrity(
    Insertable<DriftUserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta),
      );
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftUserData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_name'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      password:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}password'],
          )!,
    );
  }

  @override
  $DriftUserTable createAlias(String alias) {
    return $DriftUserTable(attachedDatabase, alias);
  }
}

class DriftUserData extends DataClass implements Insertable<DriftUserData> {
  final int id;
  final String userName;
  final String email;
  final String password;
  const DriftUserData({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  DriftUserCompanion toCompanion(bool nullToAbsent) {
    return DriftUserCompanion(
      id: Value(id),
      userName: Value(userName),
      email: Value(email),
      password: Value(password),
    );
  }

  factory DriftUserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftUserData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  DriftUserData copyWith({
    int? id,
    String? userName,
    String? email,
    String? password,
  }) => DriftUserData(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
  );
  DriftUserData copyWithCompanion(DriftUserCompanion data) {
    return DriftUserData(
      id: data.id.present ? data.id.value : this.id,
      userName: data.userName.present ? data.userName.value : this.userName,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftUserData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userName, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftUserData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.password == this.password);
}

class DriftUserCompanion extends UpdateCompanion<DriftUserData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> email;
  final Value<String> password;
  const DriftUserCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  DriftUserCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String email,
    required String password,
  }) : userName = Value(userName),
       email = Value(email),
       password = Value(password);
  static Insertable<DriftUserData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  DriftUserCompanion copyWith({
    Value<int>? id,
    Value<String>? userName,
    Value<String>? email,
    Value<String>? password,
  }) {
    return DriftUserCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftUserCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftUserDataBase extends GeneratedDatabase {
  _$DriftUserDataBase(QueryExecutor e) : super(e);
  $DriftUserDataBaseManager get managers => $DriftUserDataBaseManager(this);
  late final $DriftUserTable driftUser = $DriftUserTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftUser];
}

typedef $$DriftUserTableCreateCompanionBuilder =
    DriftUserCompanion Function({
      Value<int> id,
      required String userName,
      required String email,
      required String password,
    });
typedef $$DriftUserTableUpdateCompanionBuilder =
    DriftUserCompanion Function({
      Value<int> id,
      Value<String> userName,
      Value<String> email,
      Value<String> password,
    });

class $$DriftUserTableFilterComposer
    extends Composer<_$DriftUserDataBase, $DriftUserTable> {
  $$DriftUserTableFilterComposer({
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

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DriftUserTableOrderingComposer
    extends Composer<_$DriftUserDataBase, $DriftUserTable> {
  $$DriftUserTableOrderingComposer({
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

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DriftUserTableAnnotationComposer
    extends Composer<_$DriftUserDataBase, $DriftUserTable> {
  $$DriftUserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$DriftUserTableTableManager
    extends
        RootTableManager<
          _$DriftUserDataBase,
          $DriftUserTable,
          DriftUserData,
          $$DriftUserTableFilterComposer,
          $$DriftUserTableOrderingComposer,
          $$DriftUserTableAnnotationComposer,
          $$DriftUserTableCreateCompanionBuilder,
          $$DriftUserTableUpdateCompanionBuilder,
          (
            DriftUserData,
            BaseReferences<_$DriftUserDataBase, $DriftUserTable, DriftUserData>,
          ),
          DriftUserData,
          PrefetchHooks Function()
        > {
  $$DriftUserTableTableManager(_$DriftUserDataBase db, $DriftUserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DriftUserTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DriftUserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DriftUserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
              }) => DriftUserCompanion(
                id: id,
                userName: userName,
                email: email,
                password: password,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userName,
                required String email,
                required String password,
              }) => DriftUserCompanion.insert(
                id: id,
                userName: userName,
                email: email,
                password: password,
              ),
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

typedef $$DriftUserTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftUserDataBase,
      $DriftUserTable,
      DriftUserData,
      $$DriftUserTableFilterComposer,
      $$DriftUserTableOrderingComposer,
      $$DriftUserTableAnnotationComposer,
      $$DriftUserTableCreateCompanionBuilder,
      $$DriftUserTableUpdateCompanionBuilder,
      (
        DriftUserData,
        BaseReferences<_$DriftUserDataBase, $DriftUserTable, DriftUserData>,
      ),
      DriftUserData,
      PrefetchHooks Function()
    >;

class $DriftUserDataBaseManager {
  final _$DriftUserDataBase _db;
  $DriftUserDataBaseManager(this._db);
  $$DriftUserTableTableManager get driftUser =>
      $$DriftUserTableTableManager(_db, _db.driftUser);
}
