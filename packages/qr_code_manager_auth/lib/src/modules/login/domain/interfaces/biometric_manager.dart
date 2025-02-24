import 'package:oxidized/oxidized.dart';

abstract class BiometricManager {
  const BiometricManager();

  Future<Result<bool, Exception>> authenticate();
}
