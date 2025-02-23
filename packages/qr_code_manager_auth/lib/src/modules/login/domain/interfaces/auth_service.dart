import 'package:flutter/foundation.dart';
import 'package:oxidized/oxidized.dart';

@immutable
abstract class AuthService {
  const AuthService();

  Future<Result<bool, Exception>> recoverlogin();
  Future<Option<Exception>> login({
    required String emailOrUserName,
    required String password,
  });
}
