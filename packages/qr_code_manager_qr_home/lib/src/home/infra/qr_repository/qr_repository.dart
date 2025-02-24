import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/entity/qr.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/qr_repo.dart';
import 'package:qr_code_manager_qr_home/src/home/infra/qr_repository/db/qr_db.dart';

final class DriftQrRepository extends QrRepository {
  const DriftQrRepository({required DriftQrDataBase driftQrDataBase})
    : _driftQrDataBase = driftQrDataBase;

  final DriftQrDataBase _driftQrDataBase;

  @override
  Future<Result<List<AppQr>, Exception>> getQrRegistered() async {
    try {
      final result =
          await _driftQrDataBase.select(_driftQrDataBase.driftQr).get();

      final items =
          result.map((e) => AppQr(name: e.name, value: e.value)).toList();

      return Result.ok(items);
    } on Exception catch (e) {
      return Result.err(e);
    }
  }

  @override
  Future<Option<Exception>> save(AppQr qr) async {
    try {
      await _driftQrDataBase
          .into(_driftQrDataBase.driftQr)
          .insert(DriftQrCompanion.insert(name: qr.name, value: qr.value));

      return const None();
    } on Exception catch (e) {
      return Some(e);
    }
  }
}
