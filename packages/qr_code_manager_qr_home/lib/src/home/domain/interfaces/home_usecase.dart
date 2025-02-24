import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';

@immutable
abstract class HomeUsecase {
  const HomeUsecase();

  Future<Result<String, Exception>> readQrCode();
}
