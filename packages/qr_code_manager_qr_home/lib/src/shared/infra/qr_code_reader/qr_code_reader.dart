import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/shared/domain/interfaces/qr_code_reader.dart';
import 'package:qr_code_manager_qr_home/src/shared/infra/qr_code_reader/qr_code_reader_api.g.dart';

final class MultiPlatformQrCodeReader extends QrCodeReader {
  @override
  Future<Result<String, Exception>> readQrCode() async {
    try {
      final api = QrScannerNativeApi();
      final result = await api.scanQrCode();
      if (result == null) {
        return Result.err(Exception('Failed to read QR code'));
      }

      return Result.ok(result);
    } on PlatformException catch (e) {
      return Result.err(Exception(e.message));
    }
  }
}
