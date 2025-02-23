import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';

@immutable
abstract class BiometricManager {
  const BiometricManager();

  Future<Result<bool, Exception>> authenticate();
}
