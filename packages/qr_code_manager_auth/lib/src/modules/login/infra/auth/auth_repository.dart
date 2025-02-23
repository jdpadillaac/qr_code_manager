import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/auth_repo.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';
import 'package:qr_code_manager_auth/src/shared/infra/drift/user_db.dart';

final class AppAuthRepository extends AuthenticationRepo {
  const AppAuthRepository({
    required DriftUserDataBase driftUserDataBase,
    required FlutterSecureStorage flutterSecureStorage,
  }) : _driftUserDataBase = driftUserDataBase,
       _flutterSecureStorage = flutterSecureStorage;

  final DriftUserDataBase _driftUserDataBase;
  final FlutterSecureStorage _flutterSecureStorage;

  @override
  Future<Result<User, Exception>> authenticate({
    required String emailOrUserName,
    required String password,
  }) async {
    try {
      final query = _driftUserDataBase.select(_driftUserDataBase.driftUser)
        ..where(
          (e) =>
              e.email.equals(emailOrUserName) |
              e.userName.equals(emailOrUserName),
        );

      final result = await query.getSingleOrNull();
      if (result == null) {
        return Result.err(Exception('User not found'));
      }

      if (result.password != password) {
        return Result.err(Exception('Password is incorrect'));
      }

      return Result.ok(
        User(
          email: result.email,
          password: result.password,
          userName: result.userName,
          enableBiometricAuth: result.enableBiometricAuth,
        ),
      );
    } on Exception catch (e) {
      return Result.err(e);
    }
  }

  @override
  Future<Option<Exception>> isUserPreviousliAunthenticated() async {
    final dd = await _flutterSecureStorage.read(key: 'authenticated_user');
    return dd == null ? Some(Exception('User is authenticated')) : const None();
  }

  @override
  Future<Option<Exception>> saveAuth({required User user}) async {
    try {
      await _flutterSecureStorage.write(
        key: 'authenticated_user',
        value: user.email,
      );
      return const None();
    } on Exception catch (e) {
      return Some(e);
    }
  }
}
