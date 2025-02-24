import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/entity/qr.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/home_usecase.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/qr_repo.dart';
import 'package:qr_code_manager_qr_home/src/shared/domain/interfaces/qr_code_reader.dart';

final class AppHomeUsecasee extends HomeUsecase {
  const AppHomeUsecasee({
    required QrCodeReader qrCodeReader,
    required QrRepository qrRepository,
  }) : _qrCodeReader = qrCodeReader,
       _qrRepository = qrRepository;

  final QrCodeReader _qrCodeReader;
  final QrRepository _qrRepository;

  @override
  Future<Result<String, Exception>> readQrCode() async {
    final result = await _qrCodeReader.readQrCode();
    return result;
  }

  @override
  Future<Result<List<AppQr>, Exception>> getQrRegistered() {
    return _qrRepository.getQrRegistered();
  }

  @override
  Future<Option<Exception>> save(AppQr qr) {
    return _qrRepository.save(qr);
  }
}
