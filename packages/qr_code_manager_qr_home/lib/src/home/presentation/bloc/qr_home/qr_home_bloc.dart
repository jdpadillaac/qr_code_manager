import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_home_event.dart';
part 'qr_home_state.dart';

class QrHomeBloc extends Bloc<QrHomeEvent, QrHomeState> {
  QrHomeBloc() : super(QrHomeInitial()) {
    on<QrHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
