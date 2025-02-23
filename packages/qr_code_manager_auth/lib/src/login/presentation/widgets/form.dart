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
          const QcmTextFormField(
            hintText: 'Ingresa tu correo',
            labelText: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
          ),
          QcmVerticalSpacing.large,
          const QcmTextFormObscure(
            labelText: 'Contraseña',
            hintText: 'Contraseña',
          ),
          QcmVerticalSpacing.xxlarge,
          QcmElevatedButton(label: 'Iniciar sesión', onPressed: () {}),
        ],
      ),
    );
  }
}
