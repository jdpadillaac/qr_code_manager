part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
  @override
  List<Object?> get props => [];
}

final class AuthSuccessState extends AuthState {
  const AuthSuccessState();
  @override
  List<Object?> get props => [];
}

final class AuthErrorState extends AuthState {
  const AuthErrorState();
  @override
  List<Object?> get props => [];
}

final class AuthLoadingState extends AuthState {
  const AuthLoadingState();
  @override
  List<Object?> get props => [];
}
