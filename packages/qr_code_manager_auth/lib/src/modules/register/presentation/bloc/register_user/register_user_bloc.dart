import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/models/register_user_model.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc({
    required RegisterUserRepo registerUserRepo,
    required BiometricManager biometricManager,
  }) : _registerUserRepo = registerUserRepo,
       _biometricManager = biometricManager,
       super(const RegisterUserInitial()) {
    on<OnRegisterUserEvent>(_onRegisterUserEvent);
  }

  final RegisterUserRepo _registerUserRepo;
  final BiometricManager _biometricManager;

  Future<void> _onRegisterUserEvent(
    OnRegisterUserEvent event,
    Emitter<RegisterUserState> emit,
  ) async {
    emit(const RegisterUserLoading());

    if (event.enableFaceId) {
      final biometricResult = await _biometricManager.authenticate();
      if (biometricResult.isErr()) {
        emit(const NotBiometricEnableError());
        return;
      }
    }

    final result = await _registerUserRepo.registerUser(
      registerUserModel: RegisterUserModel(
        email: event.email,
        password: event.password,
        userName: event.username,
      ),
    );

    result.when(
      some: (_) {
        emit(const RegisterUserError());
      },
      none: () {
        emit(const RegisterUserSuccess());
      },
    );
  }
}
