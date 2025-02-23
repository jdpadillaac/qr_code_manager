import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/register/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<RegisterUserBloc>(),
      child: const _Pagelistener(),
    );
  }
}

class _Pagelistener extends StatelessWidget {
  const _Pagelistener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterUserBloc, RegisterUserState>(
      listener: (context, state) {},
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return QcmScrollablePageTemplate(
      showAppBar: true,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const QcmHeadlineMedium('Bienvenido!', fontSize: 28),
        const QcmTitleMedium(
          'Escanea y guarda tus códigos QR',
          color: QcmColors.auroMetalSaurus,
        ),
        QcmVerticalSpacing.medium,
        const _Form(),
        QcmElevatedButton(label: 'Registrate', onPressed: () {}),
        QcmVerticalSpacing.xxlarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const QcmTitleMedium(
              'Si ya estas registrado',
              color: QcmColors.auroMetalSaurus,
            ),
            QcmHorizontalSpacing.small,
            InkWell(
              onTap: () {
                Modular.to.pop();
              },
              child: const QcmTitleMedium(
                'Inicia Sesión',
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QcmTitleMedium('Nombre de usuario', fontWeight: FontWeight.w900),
        QcmVerticalSpacing.sl,
        QcmTextFormField(
          hintText: 'Ingresa tu correo',
          keyboardType: TextInputType.emailAddress,
        ),
        QcmVerticalSpacing.large,
        QcmTitleMedium('Correo electronico', fontWeight: FontWeight.w900),
        QcmTextFormField(hintText: 'Contraseña'),
        QcmVerticalSpacing.large,
        QcmTitleMedium('Contraseña', fontWeight: FontWeight.w900),
        QcmTextFormObscure(hintText: 'Contraseña'),
        QcmVerticalSpacing.xxlarge,
      ],
    );
  }
}
