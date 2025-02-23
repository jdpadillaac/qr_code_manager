import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/qr_code_manager_auth.dart';

final class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
  }
}
