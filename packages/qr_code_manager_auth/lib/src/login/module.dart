import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/login/presentation/page.dart';

final class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
