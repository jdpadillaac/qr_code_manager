import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/entity/qr.dart';
import 'package:qr_code_manager_qr_home/src/home/presentation/bloc/qr_home/qr_home_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widget/detail_sheet.dart';
part 'widget/qr_list.dart';
part 'widget/register_sheet.dart';

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
        } else if (state is SaveQrSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Código QR guardado con éxito'),
            ),
          );
        } else if (state is SaveQrErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: QcmTitleMedium('Error al guardar el código QR'),
            ),
          );
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
                if (state is QrHomeLoadingState) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state.qrList.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: QcmTitleMedium('No tienes códigos QR guardados'),
                    ),
                  );
                }

                return _QrList(qrList: state.qrList);
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
