import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/models/register_user_model.dart';

final class DriftRegisterUserRepository extends RegisterUserRepo {
  @override
  Future<Option<Exception>> registerUser({
    required RegisterUserModel registerUserModel,
  }) async {
    return const None();
  }
}
