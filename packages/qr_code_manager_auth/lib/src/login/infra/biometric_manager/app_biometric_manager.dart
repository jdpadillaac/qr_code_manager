import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/login/domain/domain.dart';

final class PlatformBiometricManager extends BiometricManager {
  @override
  Future<Result<bool, Exception>> authenticate() async {
    const methodChannel = MethodChannel('com.example.biometric_manager');

    try {
      final result = await methodChannel.invokeMethod<bool>('biometric_auth');
      if (result == null) {
        return Result.err(Exception('Failed to authenticate'));
      }

      return Result.ok(result);
    } on PlatformException catch (e) {
      return Result.err(Exception(e.toString()));
    }
  }
}
