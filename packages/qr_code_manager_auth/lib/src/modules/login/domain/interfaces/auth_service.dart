import 'package:oxidized/oxidized.dart';

abstract class AuthService {
  const AuthService();

  Future<Result<bool, Exception>> recoverlogin();
  Future<Option<Exception>> login({
    required String emailOrUserName,
    required String password,
  });
}
