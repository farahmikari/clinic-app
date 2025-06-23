part of 'send_reservation_bloc.dart';

sealed class SendReservationState {}

final class SendReservationInitial extends SendReservationState {}

final class SendReservationLoading extends SendReservationState {}

final class SendReservationLoaded extends SendReservationState {}

final class SendReservationFailed extends SendReservationState {
  final String errorMessage;
  SendReservationFailed({required this.errorMessage});
}
