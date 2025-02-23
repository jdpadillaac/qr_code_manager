import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/login/app/auth_service/auth_service.dart';
import 'package:qr_code_manager_auth/src/login/domain/interfaces/_interfaces.dart';
import 'package:qr_code_manager_auth/src/login/infra/biometric_manager/app_biometric_manager.dart';
import 'package:qr_code_manager_auth/src/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:qr_code_manager_auth/src/login/presentation/page.dart';

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
