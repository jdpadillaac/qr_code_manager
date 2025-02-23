part of '../page.dart';

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QcmHeadlineMedium('Bienvenido!', fontSize: 28),
        QcmTitleMedium(
          'Escanea y guarda tus códigos QR',
          color: QcmColors.auroMetalSaurus,
        ),
      ],
    );
  }
}
