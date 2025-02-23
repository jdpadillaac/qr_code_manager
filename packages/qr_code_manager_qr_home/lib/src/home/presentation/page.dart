import 'package:flutter/widgets.dart';
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
    return const QcmPageTemplate(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(child: SingleChildScrollView(child: Column())),
            ),
          ],
        ),
      ),
    );
  }
}
