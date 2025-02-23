import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/modules/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:qr_code_manager_auth/src/modules/register/module.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

part 'widgets/form.dart';
part 'widgets/register_button.dart';
part 'widgets/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => Modular.get<AuthBloc>()..add(const ValidateAuthEvent()),
      child: const _PageListener(),
    );
  }
}

class _PageListener extends StatelessWidget {
  const _PageListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Modular.to.pushReplacementNamed('/qr_home/home/');
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al iniciar sesión')),
          );
        }
      },
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return const QcmPageTemplate(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [_Title(), QcmVerticalSpacing.xxlarge, _Form()],
                  ),
                ),
              ),
            ),
            _GoToRegisterButton(),
          ],
        ),
      ),
    );
  }
}
