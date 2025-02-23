part of '../page.dart';

class _GoToRegisterButton extends StatelessWidget {
  const _GoToRegisterButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const QcmTitleMedium(
            'No tienes cuenta?',
            color: QcmColors.auroMetalSaurus,
          ),
          QcmHorizontalSpacing.small,
          InkWell(
            onTap: () {
              Modular.to.pushNamed(RegisterUserModule.routeName);
            },
            child: const QcmTitleMedium(
              'Regístrate',
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
