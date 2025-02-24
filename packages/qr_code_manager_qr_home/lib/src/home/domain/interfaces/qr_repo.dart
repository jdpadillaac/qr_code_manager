import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/entity/qr.dart';

@immutable
abstract class QrRepository {
  const QrRepository();
  Future<Result<List<AppQr>, Exception>> getQrRegistered();
  Future<Option<Exception>> save(AppQr qr);
}
