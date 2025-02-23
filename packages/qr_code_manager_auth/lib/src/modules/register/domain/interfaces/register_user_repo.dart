import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';

@immutable
abstract class RegisterUserRepo {
  Future<Option<Exception>> registerUser({required User registerUserModel});
}
