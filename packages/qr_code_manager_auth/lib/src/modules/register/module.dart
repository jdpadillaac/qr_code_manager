import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/_interfaces.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/infra/register_user_repo/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:qr_code_manager_auth/src/modules/register/presentation/page.dart';
import 'package:qr_code_manager_auth/src/shared/infra/biometric_manager/app_biometric_manager.dart';
import 'package:qr_code_manager_auth/src/shared/module.dart';

final class RegisterUserModule extends Module {
  static const String routeName = '/register/';

  @override
  List<Module> get imports => [AuthSahredModule()];

  @override
  void binds(Injector i) {
    i
      ..add<RegisterUserBloc>(RegisterUserBloc.new)
      ..add<BiometricManager>(PlatformBiometricManager.new)
      ..add<RegisterUserRepo>(DriftRegisterUserRepository.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterUserPage());
    super.routes(r);
  }
}
