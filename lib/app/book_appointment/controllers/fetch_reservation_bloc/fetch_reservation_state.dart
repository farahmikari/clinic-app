part of 'fetch_reservation_bloc.dart';

sealed class FetchReservationState extends Equatable {
  const FetchReservationState();

  @override
  List<Object> get props => [];
}

final class FetchReservationLoading extends FetchReservationState {}

final class FetchReservationLoaded extends FetchReservationState {
  final ReservationModel reservation;

  const FetchReservationLoaded({required this.reservation});
}

final class FetchReservationFailed extends FetchReservationState {
  final String errorMessage;

  const FetchReservationFailed({required this.errorMessage});
}
