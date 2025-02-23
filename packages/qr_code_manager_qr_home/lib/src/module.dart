import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_qr_home/src/home/module.dart';

final class QrHomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
  }
}
