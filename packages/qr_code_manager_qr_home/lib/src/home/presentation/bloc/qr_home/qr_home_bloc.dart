import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/home_usecase.dart';

part 'qr_home_event.dart';
part 'qr_home_state.dart';

class QrHomeBloc extends Bloc<QrHomeEvent, QrHomeState> {
  QrHomeBloc({required HomeUsecase appHomeUsecasee})
    : _appHomeUsecasee = appHomeUsecasee,
      super(const QrHomeInitial()) {
    on<ReadQrEvent>(_onReadQrEvent);
  }

  final HomeUsecase _appHomeUsecasee;

  Future<void> _onReadQrEvent(
    ReadQrEvent event,
    Emitter<QrHomeState> emit,
  ) async {
    final result = await _appHomeUsecasee.readQrCode();
    if (result.isErr()) {
      emit(const ReadQrErrorState());
      return;
    }

    emit(ReadQrSuccesState(result.unwrap()));
  }
}
