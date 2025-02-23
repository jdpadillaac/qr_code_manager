import 'package:flutter/material.dart';

class QcmPageTemplate extends StatelessWidget {
  const QcmPageTemplate({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body);
  }
}
