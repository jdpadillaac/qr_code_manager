import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';

@immutable
abstract class AuthenticationRepo {
  const AuthenticationRepo();

  Future<Option<Exception>> isUserPreviousliAunthenticated();
  Future<Option<Exception>> saveAuth({required User user});

  Future<Result<User, Exception>> authenticate({
    required String emailOrUserName,
    required String password,
  });
}
