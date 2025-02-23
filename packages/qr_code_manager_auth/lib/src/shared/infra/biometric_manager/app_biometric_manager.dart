import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';

final class PlatformBiometricManager extends BiometricManager {
  @override
  Future<Result<bool, Exception>> authenticate() async {
    const methodChannel = MethodChannel('biometic_auth');

    try {
      final result = await methodChannel.invokeMethod<bool>(
        'validateBiometric',
      );
      if (result == null) {
        return Result.err(Exception('Failed to authenticate'));
      }

      return Result.ok(result);
    } on PlatformException catch (e) {
      return Result.err(Exception(e.toString()));
    }
  }
}
