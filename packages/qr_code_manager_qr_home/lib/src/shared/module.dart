import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_qr_home/src/shared/domain/interfaces/qr_code_reader.dart';
import 'package:qr_code_manager_qr_home/src/shared/infra/qr_code_reader/qr_code_reader.dart';

final class QrHomeSharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<QrCodeReader>(MultiPlatformQrCodeReader.new);
    super.exportedBinds(i);
  }
}
