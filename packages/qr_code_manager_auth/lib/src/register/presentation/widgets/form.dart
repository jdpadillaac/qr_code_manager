part of '../page.dart';

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
