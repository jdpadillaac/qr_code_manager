part of 'qr_home_bloc.dart';

@immutable
sealed class QrHomeEvent {
  const QrHomeEvent();
}

class ReadQrEvent extends QrHomeEvent {
  const ReadQrEvent();
}
