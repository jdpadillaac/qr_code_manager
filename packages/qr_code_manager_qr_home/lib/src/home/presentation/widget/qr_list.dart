part of '../page.dart';

class _QrList extends StatelessWidget {
  const _QrList({required this.qrList});

  final List<AppQr> qrList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: qrList.length,
        itemBuilder: (context, index) {
          final item = qrList[index];
          return Column(
            children: [
              ListTile(
                onTap: () {},
                title: QcmBodyLarge(item.name, fontWeight: FontWeight.w800),
                leading: const Icon(
                  Icons.qr_code,
                  color: QcmColors.auroMetalSaurus,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: QcmColors.auroMetalSaurus,
                ),
              ),
              Container(
                height: 1, // Grosor del borde
                color: QcmColors.darkJungleGreen, // Color del borde
              ),
            ],
          );
        },
      ),
    );
  }
}
