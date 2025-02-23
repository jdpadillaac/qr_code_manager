import 'package:flutter/foundation.dart';

@immutable
final class User {
  const User({
    required this.email,
    required this.password,
    required this.userName,
    required this.enableBiometricAuth,
  });

  final String email;
  final String password;
  final String userName;
  final bool enableBiometricAuth;
}
