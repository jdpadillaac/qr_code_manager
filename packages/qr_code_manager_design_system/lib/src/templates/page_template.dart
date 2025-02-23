import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class QcmPageTemplate extends StatelessWidget {
  const QcmPageTemplate({
    required this.body,
    this.floatingActionButton,
    super.key,
  });

  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QcmSpacing.medium),
        child: body,
      ),
    );
  }
}

class QcmScrollablePageTemplate extends StatelessWidget {
  const QcmScrollablePageTemplate({
    required this.children,
    super.key,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.showAppBar = false,
    this.floatingActionButton,
  });

  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool showAppBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: showAppBar ? AppBar() : null,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: QcmSpacing.medium),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
