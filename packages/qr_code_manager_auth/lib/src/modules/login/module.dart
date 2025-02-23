import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/modules/login/app/auth_service/auth_service.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/_interfaces.dart';
import 'package:qr_code_manager_auth/src/modules/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:qr_code_manager_auth/src/modules/login/presentation/page.dart';
import 'package:qr_code_manager_auth/src/shared/infra/biometric_manager/app_biometric_manager.dart';

final class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<AuthService>(AppAuthService.new)
      ..add<BiometricManager>(PlatformBiometricManager.new)
      ..add<AuthBloc>(AuthBloc.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
