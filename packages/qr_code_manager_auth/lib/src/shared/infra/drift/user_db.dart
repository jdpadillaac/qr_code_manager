import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'user_db.g.dart';

class DriftUser extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  BoolColumn get enableBiometricAuth =>
      boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [DriftUser])
class DriftUserDataBase extends _$DriftUserDataBase {
  DriftUserDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'user_db_v2');
  }
}
