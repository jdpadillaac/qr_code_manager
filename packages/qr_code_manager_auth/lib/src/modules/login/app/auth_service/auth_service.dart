import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';

final class AppAuthService extends AuthService {
  const AppAuthService({required BiometricManager biometricManager})
    : _biometricManager = biometricManager;

  final BiometricManager _biometricManager;
  @override
  Future<Result<bool, Exception>> recoverlogin() async {
    final result = await _biometricManager.authenticate();
    if (result.isOk()) {
      return Result.ok(result.unwrap());
    }

    return Result.err(result.unwrapErr());
  }
}
