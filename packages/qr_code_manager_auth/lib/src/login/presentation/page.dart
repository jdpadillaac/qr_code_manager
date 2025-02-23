import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

part 'widgets/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
