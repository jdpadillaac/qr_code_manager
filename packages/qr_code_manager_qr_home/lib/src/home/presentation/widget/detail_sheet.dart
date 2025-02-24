part of '../page.dart';

extension _DetailSheetHelper on _QrList {
  void showDetailSheet(BuildContext entryContext, {required AppQr qr}) {
    showCupertinoModalPopup<dynamic>(
      context: entryContext,
      builder: (context) {
        final isValidUrl = _isValidUrl(qr.value);
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
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Column(
              children: [
                QcmTitleLarge(qr.name),
                QcmVerticalSpacing.large,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(QcmSpacing.medium),
                    decoration: BoxDecoration(
                      color: QcmColors.darkJungleGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        initialValue: qr.value,
                        enabled: true,
                        readOnly: true,
                        minLines: 1,
                        maxLines: 30,
                        style: TextTheme.of(
                          context,
                        ).bodyLarge?.copyWith(color: QcmColors.white),
                      ),
                    ),
                  ),
                ),
                QcmVerticalSpacing.sl,
                QcmOutlinedButton(
                  label: 'Copiar',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: qr.value));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: QcmTitleMedium('Copiado al portapapeles'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
                if (isValidUrl) QcmVerticalSpacing.sl,
                if (isValidUrl)
                  QcmOutlinedButton(
                    label: 'Ir al link',
                    onPressed: () {
                      final url = Uri.parse(qr.value);
                      launchUrl(url);
                    },
                  ),
                const Expanded(child: SizedBox.shrink()),
                QcmElevatedButton(
                  label: 'Cerrar',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isValidUrl(String text) {
    final urlPattern = RegExp(
      r'^(https?:\/\/)?([\w\-]+\.)+[\w]{2,}(\/\S*)?$',
      caseSensitive: false,
    );
    return urlPattern.hasMatch(text);
  }
}
