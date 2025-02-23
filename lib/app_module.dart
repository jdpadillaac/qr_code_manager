import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/qr_code_manager_auth.dart';
import 'package:qr_code_manager_qr_home/qr_code_manager_qr_home.dart';

final class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r
      ..module('/', module: AuthModule())
      ..module('/qr_home', module: QrHomeModule());
    super.routes(r);
  }
}
