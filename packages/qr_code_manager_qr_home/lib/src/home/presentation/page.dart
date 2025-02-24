import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';
import 'package:qr_code_manager_qr_home/src/home/presentation/bloc/qr_home/qr_home_bloc.dart';

class QrHomePage extends StatelessWidget {
  const QrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrHomeBloc>(
      create:
          (context) => Modular.get<QrHomeBloc>()..add(const LoadQrListEvent()),
      child: const _Listener(),
    );
  }
}

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrHomeBloc, QrHomeState>(
      listener: (context, state) {
        if (state is ReadQrErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Error al leer el código QR'),
            ),
          );
        } else if (state is ReadQrSuccesState) {
          showRegisterCodesheet(context, qrCode: state.qrCode);
        }
      },
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
            BlocBuilder<QrHomeBloc, QrHomeState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.qrList.length,
                    itemBuilder: (context, index) {
                      final item = state.qrList[index];
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            title: QcmBodyLarge(
                              item.name,
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
                );
              },
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
        BlocProvider.of<QrHomeBloc>(context).add(const ReadQrEvent());
      },
    );
  }
}

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
