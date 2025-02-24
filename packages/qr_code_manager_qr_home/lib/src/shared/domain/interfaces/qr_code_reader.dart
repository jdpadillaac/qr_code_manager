import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';

@immutable
abstract class QrCodeReader {
  const QrCodeReader();

  Future<Result<String, Exception>> readQrCode();
}
