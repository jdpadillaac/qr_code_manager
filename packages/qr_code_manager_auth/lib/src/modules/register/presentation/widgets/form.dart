part of '../page.dart';

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QcmTextFormField(
            controller: _usernameController,
            labelText: 'Nombre de usuario',
            hintText: 'Eje: Juanito',
          ),
          QcmVerticalSpacing.large,
          QcmTextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Correo electronico',
            hintText: 'email@email.com',
          ),
          QcmVerticalSpacing.large,
          QcmTextFormObscure(
            controller: _passwordController,
            labelText: 'Contraseña',
            hintText: 'Contraseña',
          ),
          QcmVerticalSpacing.xxlarge,
          QcmElevatedButton(
            label: 'Registrate',
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                BlocProvider.of<RegisterUserBloc>(context).add(
                  OnRegisterUserEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _usernameController.text,
                  ),
                );
              }
            },
          ),
          QcmVerticalSpacing.xxlarge,
        ],
      ),
    );
  }
}
