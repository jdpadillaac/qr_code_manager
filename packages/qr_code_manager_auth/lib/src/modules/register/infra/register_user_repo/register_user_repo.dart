import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';
import 'package:qr_code_manager_auth/src/shared/infra/drift/user_db.dart';

final class DriftRegisterUserRepository extends RegisterUserRepo {
  DriftRegisterUserRepository({required DriftUserDataBase driftUserDataBase})
    : _driftUserDataBase = driftUserDataBase;

  final DriftUserDataBase _driftUserDataBase;
  @override
  Future<Option<Exception>> registerUser({
    required User registerUserModel,
  }) async {
    try {
      await _driftUserDataBase
          .into(_driftUserDataBase.driftUser)
          .insert(
            DriftUserCompanion.insert(
              email: registerUserModel.email,
              password: registerUserModel.password,
              userName: registerUserModel.userName,
              enableBiometricAuth: registerUserModel.enableBiometricAuth,
            ),
          );
      return const None();
    } on Exception catch (e) {
      return Some(e);
    }
  }
}
