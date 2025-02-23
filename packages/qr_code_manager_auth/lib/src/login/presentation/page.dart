import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const QcmPageTemplate(
      body: Center(child: SingleChildScrollView(child: Column())),
    );
  }
}
