part of 'register_user_bloc.dart';

@immutable
sealed class RegisterUserState {
  const RegisterUserState();
}

final class RegisterUserInitial extends RegisterUserState {
  const RegisterUserInitial();
}

final class RegisterUserLoading extends RegisterUserState {
  const RegisterUserLoading();
}

final class RegisterUserError extends RegisterUserState {
  const RegisterUserError();
}

final class RegisterUserSuccess extends RegisterUserState {
  const RegisterUserSuccess();
}
