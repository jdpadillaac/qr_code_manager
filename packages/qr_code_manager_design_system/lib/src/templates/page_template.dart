import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class QcmPageTemplate extends StatelessWidget {
  const QcmPageTemplate({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QcmSpacing.medium),
        child: body,
      ),
    );
  }
}

class QcmScrollablePageTemplate extends StatelessWidget {
  const QcmScrollablePageTemplate({
    required this.childer,
    super.key,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  final List<Widget> childer;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QcmSpacing.medium),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: childer,
          ),
        ),
      ),
    );
  }
}
