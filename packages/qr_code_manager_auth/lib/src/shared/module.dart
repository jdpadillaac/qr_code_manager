import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/shared/infra/drift/user_db.dart';

final class AuthSahredModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<DriftUserDataBase>(
      DriftUserDataBase.new,
      config: BindConfig(onDispose: (value) => value.close()),
    );
    super.exportedBinds(i);
  }
}
