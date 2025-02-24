part of 'qr_home_bloc.dart';

@immutable
sealed class QrHomeEvent extends Equatable {
  const QrHomeEvent();
}

class ReadQrEvent extends QrHomeEvent {
  const ReadQrEvent();

  @override
  List<Object?> get props => [];
}

class LoadQrListEvent extends QrHomeEvent {
  const LoadQrListEvent();

  @override
  List<Object?> get props => [];
}

class SaveNewQrEvent extends QrHomeEvent {
  const SaveNewQrEvent(this.name, this.value);

  final String name;
  final String value;

  @override
  List<Object?> get props => [name, value];
}
