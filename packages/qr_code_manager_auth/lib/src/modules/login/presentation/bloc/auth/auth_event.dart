part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class ValidateAuthEvent extends AuthEvent {
  const ValidateAuthEvent();

  @override
  List<Object?> get props => [];
}

final class OnloginEvent extends AuthEvent {
  const OnloginEvent({required this.emailOrUserName, required this.password});

  final String emailOrUserName;
  final String password;

  @override
  List<Object?> get props => [emailOrUserName, password];
}
