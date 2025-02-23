part of '../page.dart';

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
