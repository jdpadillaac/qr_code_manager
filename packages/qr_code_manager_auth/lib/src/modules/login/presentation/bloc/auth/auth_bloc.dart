import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/_interfaces.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthService authService})
    : _authService = authService,
      super(const AuthInitial()) {
    on<ValidateAuthEvent>(_onValidateAuthEvent);
    on<OnloginEvent>(_onOnloginEvent);
  }

  final AuthService _authService;

  Future<void> _onValidateAuthEvent(
    ValidateAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _authService.recoverlogin();

    if (result.isErr()) {
      return;
    }

    final successAuth = result.unwrap();
    if (!successAuth) {
      return;
    }

    emit(const AuthSuccessState());
  }

  Future<void> _onOnloginEvent(
    OnloginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final result = await _authService.login(
      emailOrUserName: event.emailOrUserName,
      password: event.password,
    );

    if (result.isSome()) {
      emit(const AuthErrorState());
      return;
    }

    emit(const AuthSuccessState());
  }
}
