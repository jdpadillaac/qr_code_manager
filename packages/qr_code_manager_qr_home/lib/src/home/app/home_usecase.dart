import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/home_usecase.dart';
import 'package:qr_code_manager_qr_home/src/shared/domain/interfaces/qr_code_reader.dart';

final class AppHomeUsecasee extends HomeUsecase {
  const AppHomeUsecasee({required QrCodeReader qrCodeReader})
    : _qrCodeReader = qrCodeReader;

  final QrCodeReader _qrCodeReader;

  @override
  Future<Result<String, Exception>> readQrCode() async {
    final result = await _qrCodeReader.readQrCode();
    return result;
  }
}
