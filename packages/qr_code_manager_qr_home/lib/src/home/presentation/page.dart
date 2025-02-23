import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';
import 'package:qr_code_manager_qr_home/src/home/presentation/bloc/qr_home/qr_home_bloc.dart';

class QrHomePage extends StatelessWidget {
  const QrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrHomeBloc>(
      create: (context) => Modular.get<QrHomeBloc>(),
      child: const _Listener(),
    );
  }
}

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrHomeBloc, QrHomeState>(
      listener: (context, state) {},
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return QcmPageTemplate(
      floatingActionButton: const _FloatingAction(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const QcmTitleLarge('Tus códigos QR'),
            QcmVerticalSpacing.large,
            Expanded(
              child: ListView.builder(
                itemCount: 500,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        title: const QcmBodyLarge(
                          'Codigo x',
                          fontWeight: FontWeight.w800,
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingAction extends StatelessWidget {
  const _FloatingAction();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(QcmSpacing.medium),
        ),
        backgroundColor: WidgetStateProperty.all(QcmColors.unitedNationsBlue),
      ),
      icon: const Icon(Icons.qr_code_scanner),
      onPressed: () async {
        const methodChannel = MethodChannel('qr_scanner');

        final result = await methodChannel.invokeMethod('scanQrCode');
        if (result == null) {
          print('nada');
        } else {
          print('ok $result');
        }
      },
    );
  }
}
