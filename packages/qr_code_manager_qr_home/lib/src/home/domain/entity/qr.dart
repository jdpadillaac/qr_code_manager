import 'package:flutter/foundation.dart';

@immutable
final class AppQr {
  const AppQr({required this.name, required this.value});

  final String name;
  final String value;
}
