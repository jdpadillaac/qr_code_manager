import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager/main.dart';

final class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const MyHomePage(title: 'Some'));
  }
}
