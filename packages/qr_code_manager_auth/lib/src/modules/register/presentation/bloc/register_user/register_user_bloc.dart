import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/interfaces/register_user_repo.dart';
import 'package:qr_code_manager_auth/src/modules/register/domain/models/register_user_model.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc({required RegisterUserRepo registerUserRepo})
    : _registerUserRepo = registerUserRepo,
      super(const RegisterUserInitial()) {
    on<OnRegisterUserEvent>(_onRegisterUserEvent);
  }

  final RegisterUserRepo _registerUserRepo;

  Future<void> _onRegisterUserEvent(
    OnRegisterUserEvent event,
    Emitter<RegisterUserState> emit,
  ) async {
    emit(const RegisterUserLoading());
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
