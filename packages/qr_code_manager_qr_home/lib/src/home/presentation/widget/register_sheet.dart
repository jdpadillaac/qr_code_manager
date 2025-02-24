part of '../page.dart';

extension _ListenerHelper on _Listener {
  void showRegisterCodesheet(
    BuildContext entryContext, {
    required String qrCode,
  }) {
    final qrCtr = TextEditingController()..text = qrCode;
    final nameCtr = TextEditingController();

    showCupertinoModalPopup<dynamic>(
      context: entryContext,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.all(QcmSpacing.large),
            decoration: const BoxDecoration(
              color: QcmColors.yankeesBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(QcmSpacing.large),
                topRight: Radius.circular(QcmSpacing.large),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const QcmTitleLarge('Guarda tu QR'),
                  QcmTextFormField(
                    labelText: 'Nombre de tu QR',
                    controller: nameCtr,
                    onFieldSubmitted: (_) {
                      BlocProvider.of<QrHomeBloc>(
                        entryContext,
                      ).add(SaveNewQrEvent(nameCtr.text, qrCtr.text));
                      Navigator.of(context).pop();
                    },
                  ),
                  QcmVerticalSpacing.sl,
                  QcmTextFormField(labelText: 'Qr leido', controller: qrCtr),
                  QcmVerticalSpacing.large,
                  QcmElevatedButton(
                    label: 'Guardar',
                    onPressed: () {
                      BlocProvider.of<QrHomeBloc>(
                        entryContext,
                      ).add(SaveNewQrEvent(nameCtr.text, qrCtr.text));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
