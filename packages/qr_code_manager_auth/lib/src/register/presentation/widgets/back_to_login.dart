part of '../page.dart';

class _BackTologin extends StatelessWidget {
  const _BackTologin();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
