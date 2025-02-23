import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_manager_auth/src/modules/register/presentation/bloc/register_user/register_user_bloc.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

part 'widgets/back_to_login.dart';
part 'widgets/form.dart';

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
      listener: (context, state) {
        if (state is RegisterUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Uusario registrado exitosamente'),
            ),
          );
          Modular.to.pop();
        } else if (state is RegisterUserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Error al registrar el usuario'),
            ),
          );
        } else if (state is NotBiometricEnableError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Error al habilitar FaceId'),
            ),
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
    return const QcmScrollablePageTemplate(
      showAppBar: true,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QcmHeadlineMedium('Bienvenido!', fontSize: 28),
        QcmTitleMedium(
          'Escanea y guarda tus códigos QR',
          color: QcmColors.auroMetalSaurus,
        ),
        QcmVerticalSpacing.medium,
        _Form(),
        _BackTologin(),
      ],
    );
  }
}
