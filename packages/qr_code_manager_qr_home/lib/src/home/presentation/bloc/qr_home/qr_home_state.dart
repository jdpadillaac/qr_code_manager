part of 'qr_home_bloc.dart';

@immutable
sealed class QrHomeState extends Equatable {
  const QrHomeState(this.qrList);

  final List<AppQr> qrList;
}

final class QrHomeLoadingState extends QrHomeState {
  const QrHomeLoadingState(super.qrList);
  @override
  List<Object?> get props => [];
}

final class QrHomeInitial extends QrHomeState {
  const QrHomeInitial() : super(const []);
  @override
  List<Object?> get props => [];
}

final class ReadQrErrorState extends QrHomeState {
  const ReadQrErrorState(super.qrList);
  @override
  List<Object?> get props => [];
}

final class SaveQrErrorState extends QrHomeState {
  const SaveQrErrorState(super.qrList);
  @override
  List<Object?> get props => [];
}

final class ReadQrSuccesState extends QrHomeState {
  const ReadQrSuccesState(this.qrCode, super.qrList);

  final String qrCode;
  @override
  List<Object?> get props => [qrCode];
}

final class SaveQrSuccessState extends QrHomeState {
  const SaveQrSuccessState(super.qrList);

  @override
  List<Object?> get props => [];
}

final class QrListLoadedSuccessState extends QrHomeState {
  const QrListLoadedSuccessState(super.qrList);
  @override
  List<Object?> get props => [];
}
