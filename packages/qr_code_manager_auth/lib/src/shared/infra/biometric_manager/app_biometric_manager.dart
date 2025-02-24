import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';
import 'package:qr_code_manager_auth/src/shared/infra/biometric_manager/biometric_channer.g.dart';

final class PlatformBiometricManager extends BiometricManager {
  @override
  Future<Result<bool, Exception>> authenticate() async {
    try {
      final api = ExampleHostApi();
      final result = await api.authenticate();
      return Result.ok(result);
    } on PlatformException catch (e) {
      return Result.err(Exception(e.toString()));
    }
  }
}
