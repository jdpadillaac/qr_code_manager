import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class QrScannerNativeApi {
  @async
  String? scanQrCode();
}
