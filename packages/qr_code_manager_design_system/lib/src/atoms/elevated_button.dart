import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class QcmElevatedButton extends StatelessWidget {
  const QcmElevatedButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(QcmColors.unitedNationsBlue),
          foregroundColor: WidgetStateProperty.all(QcmColors.white),
          padding: WidgetStateProperty.all(const EdgeInsets.all(QcmSpacing.sl)),
        ),
        onPressed: onPressed,
        child: QcmTitleLarge(label),
      ),
    );
  }
}

class QcmOutlinedButton extends StatelessWidget {
  const QcmOutlinedButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: const ButtonStyle(),
        onPressed: onPressed,
        child: QcmTitleLarge(label),
      ),
    );
  }
}
