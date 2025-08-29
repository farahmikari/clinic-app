part of 'fetch_reservation_bloc.dart';

sealed class FetchReservationState {}

final class FetchReservationLoading extends FetchReservationState {}

final class FetchReservationLoaded extends FetchReservationState {
  final ReservationModel reservation;

  FetchReservationLoaded({required this.reservation});
}

final class FetchReservationFailed extends FetchReservationState {
  final String errorMessage;

  FetchReservationFailed({required this.errorMessage});
}
