part of '../page.dart';

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QcmTextFormField(
              hintText: 'Ingresa tu correo',
              labelText: 'Correo electrónico',
              controller: emailController,
            ),
            QcmVerticalSpacing.large,
            QcmTextFormObscure(
              controller: passwordController,
              labelText: 'Contraseña',
              hintText: 'Contraseña',
            ),
            QcmVerticalSpacing.xxlarge,
            QcmElevatedButton(
              label: 'Iniciar sesión',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(
                    OnloginEvent(
                      emailOrUserName: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
