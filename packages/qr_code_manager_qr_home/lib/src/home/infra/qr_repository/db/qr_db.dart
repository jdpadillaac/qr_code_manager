import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'qr_db.g.dart';

class DriftQr extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get value => text()();
}

@DriftDatabase(tables: [DriftQr])
class DriftQrDataBase extends _$DriftQrDataBase {
  DriftQrDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'qr_code_table_v1');
  }
}
