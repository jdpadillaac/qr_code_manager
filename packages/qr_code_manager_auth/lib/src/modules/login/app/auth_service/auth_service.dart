import 'dart:async';

import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/auth_repo.dart';

final class AppAuthService extends AuthService {
  const AppAuthService({
    required BiometricManager biometricManager,
    required AuthenticationRepo authenticationRepo,
  }) : _biometricManager = biometricManager,
       _authenticationRepo = authenticationRepo;

  final BiometricManager _biometricManager;
  final AuthenticationRepo _authenticationRepo;

  @override
  Future<Result<bool, Exception>> recoverlogin() async {
    final savedAuthResult =
        await _authenticationRepo.isUserPreviousliAunthenticated();

    if (savedAuthResult.isSome()) {
      return const Result.ok(false);
    }

    final result = await _biometricManager.authenticate();
    if (result.isOk()) {
      return Result.ok(result.unwrap());
    }

    return Result.err(result.unwrapErr());
  }

  @override
  Future<Option<Exception>> login({
    required String emailOrUserName,
    required String password,
  }) async {
    final result = await _authenticationRepo.authenticate(
      emailOrUserName: emailOrUserName,
      password: password,
    );

    return result.when(
      ok: (user) {
        if (user.enableBiometricAuth) {
          unawaited(_authenticationRepo.saveAuth(user: user));
        }
        return const None();
      },
      err: (e) {
        return Some(e);
      },
    );
  }
}
