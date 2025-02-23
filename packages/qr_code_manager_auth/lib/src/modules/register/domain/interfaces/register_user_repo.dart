import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/models/register_user_model.dart';

@immutable
abstract class RegisterUserRepo {
  Future<Option<Exception>> registerUser({
    required RegisterUserModel registerUserModel,
  });
}
