import 'package:flutter/foundation.dart';

@immutable
final class RegisterUserModel {
  const RegisterUserModel({
    required this.email,
    required this.password,
    required this.userName,
  });

  final String email;
  final String password;
  final String userName;
}
