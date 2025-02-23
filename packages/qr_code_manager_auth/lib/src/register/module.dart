import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/register/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:qr_code_manager_auth/src/register/presentation/page.dart';

final class RegisterUserModule extends Module {
  static const String routeName = '/register/';

  @override
  void binds(Injector i) {
    i.add<RegisterUserBloc>(RegisterUserBloc.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterUserPage());
    super.routes(r);
  }
}
