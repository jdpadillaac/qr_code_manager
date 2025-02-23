part of 'register_user_bloc.dart';

@immutable
sealed class RegisterUserEvent extends Equatable {
  const RegisterUserEvent();
}

class OnRegisterUserEvent extends RegisterUserEvent {
  const OnRegisterUserEvent({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;

  @override
  List<Object?> get props => [email, password, username];
}
