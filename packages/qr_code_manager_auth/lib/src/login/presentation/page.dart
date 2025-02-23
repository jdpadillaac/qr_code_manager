import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

part 'widgets/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<AuthBloc>(),

      child: const _PageListener(),
    );
  }
}

class _PageListener extends StatelessWidget {
  const _PageListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return QcmPageTemplate(
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [_Title(), SizedBox(height: 50), _Form()],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const QcmTitleMedium('No tienes cuenta?'),
                  QcmHorizontalSpacing.small,
                  InkWell(
                    onTap: () {},
                    child: const QcmTitleMedium(
                      'Regístrate',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const QcmTitleMedium(
            'Correo electrónico',
            fontWeight: FontWeight.w900,
          ),
          QcmVerticalSpacing.sl,
          const QcmTextFormField(
            hintText: 'Ingresa tu correo',
            keyboardType: TextInputType.emailAddress,
          ),
          QcmVerticalSpacing.large,
          const QcmTextFormObscure(hintText: 'Contraseña'),
          QcmVerticalSpacing.xxlarge,
          QcmElevatedButton(label: 'Iniciar sesión', onPressed: () {}),
        ],
      ),
    );
  }
}
