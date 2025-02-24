import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/entity/qr.dart';
import 'package:qr_code_manager_qr_home/src/home/domain/interfaces/home_usecase.dart';

part 'qr_home_event.dart';
part 'qr_home_state.dart';

class QrHomeBloc extends Bloc<QrHomeEvent, QrHomeState> {
  QrHomeBloc({required HomeUsecase appHomeUsecasee})
    : _appHomeUsecasee = appHomeUsecasee,
      super(const QrHomeInitial()) {
    on<ReadQrEvent>(_onReadQrEvent);
    on<LoadQrListEvent>(_onLoadQrListEvent);
    on<SaveNewQrEvent>(_onSaveNewQrEvent);
  }

  final HomeUsecase _appHomeUsecasee;

  Future<void> _onSaveNewQrEvent(
    SaveNewQrEvent event,
    Emitter<QrHomeState> emit,
  ) async {
    final result = await _appHomeUsecasee.save(
      AppQr(name: event.name, value: event.value),
    );

    if (result.isSome()) {
      emit(SaveQrErrorState(state.qrList));
    } else {
      emit(SaveQrSuccessState(state.qrList));
      add(const LoadQrListEvent());
    }
  }

  Future<void> _onReadQrEvent(
    ReadQrEvent event,
    Emitter<QrHomeState> emit,
  ) async {
    emit(QrHomeLoadingState(state.qrList));
    final result = await _appHomeUsecasee.readQrCode();
    if (result.isErr()) {
      emit(ReadQrErrorState(state.qrList));
      return;
    }

    emit(ReadQrSuccesState(result.unwrap(), state.qrList));
  }

  Future<void> _onLoadQrListEvent(
    LoadQrListEvent event,
    Emitter<QrHomeState> emit,
  ) async {
    emit(QrHomeLoadingState(state.qrList));
    final list = await loadQrList();
    if (list.isErr()) {
      emit(ReadQrErrorState(state.qrList));
      return;
    }

    emit(QrListLoadedSuccessState([...list.unwrap()]));
  }

  Future<Result<List<AppQr>, Exception>> loadQrList() async {
    return _appHomeUsecasee.getQrRegistered();
  }
}
