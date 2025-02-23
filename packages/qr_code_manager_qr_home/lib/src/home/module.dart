import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_qr_home/src/home/presentation/bloc/qr_home/qr_home_bloc.dart';
import 'package:qr_code_manager_qr_home/src/home/presentation/page.dart';

final class HomeModule extends Module {
  static const String route = '/qr_home/home/';

  @override
  void binds(Injector i) {
    i.add<QrHomeBloc>(QrHomeBloc.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const QrHomePage());
    super.routes(r);
  }
}
