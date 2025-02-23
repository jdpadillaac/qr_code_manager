import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/infra/register_user_repo/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:qr_code_manager_auth/src/modules/register/presentation/page.dart';
import 'package:qr_code_manager_auth/src/shared/infra/drift/user_db.dart';

final class RegisterUserModule extends Module {
  static const String routeName = '/register/';

  @override
  void binds(Injector i) {
    i
      ..add<RegisterUserBloc>(RegisterUserBloc.new)
      ..addSingleton<DriftUserDataBase>(
        DriftUserDataBase.new,
        config: BindConfig(onDispose: (value) => value.close()),
      )
      ..add<RegisterUserRepo>(DriftRegisterUserRepository.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterUserPage());
    super.routes(r);
  }
}
