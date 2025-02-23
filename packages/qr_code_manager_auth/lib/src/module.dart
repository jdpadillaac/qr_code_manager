import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/login/module.dart';

final class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
  }
}
