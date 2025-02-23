import 'package:flutter/material.dart';

class QcmHeadlineMedium extends StatelessWidget {
  const QcmHeadlineMedium(
    this.label, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class QcmTitleMedium extends StatelessWidget {
  const QcmTitleMedium(
    this.label, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class QcmTitleLarge extends StatelessWidget {
  const QcmTitleLarge(
    this.label, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
