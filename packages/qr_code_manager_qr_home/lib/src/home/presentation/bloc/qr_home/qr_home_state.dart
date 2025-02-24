part of 'qr_home_bloc.dart';

@immutable
sealed class QrHomeState extends Equatable {
  const QrHomeState();
}

final class QrHomeInitial extends QrHomeState {
  const QrHomeInitial();
  @override
  List<Object?> get props => [];
}

final class ReadQrErrorState extends QrHomeState {
  const ReadQrErrorState();
  @override
  List<Object?> get props => [];
}

final class ReadQrSuccesState extends QrHomeState {
  const ReadQrSuccesState(this.qrCode);

  final String qrCode;
  @override
  List<Object?> get props => [qrCode];
}
