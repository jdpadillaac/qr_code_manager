import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/shared/domain/interfaces/qr_code_reader.dart';

final class MultiPlatformQrCodeReader extends QrCodeReader {
  static const _methodChannel = MethodChannel('qr_scanner');

  @override
  Future<Result<String, Exception>> readQrCode() async {
    try {
      final result = await _methodChannel.invokeMethod<String>('scanQrCode');
      if (result == null) {
        return Result.err(Exception('No se ha leído ningún código QR'));
      }

      return Result.ok(result);
    } on PlatformException catch (e) {
      return Result.err(Exception(e.message));
    }
  }
}
