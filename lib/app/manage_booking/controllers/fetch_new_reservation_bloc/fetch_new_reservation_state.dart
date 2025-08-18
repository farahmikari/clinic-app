part of 'fetch_new_reservation_bloc.dart';

sealed class FetchNewReservationState extends Equatable {
  const FetchNewReservationState();

  @override
  List<Object> get props => [];
}

final class FetchNewReservationLoading extends FetchNewReservationState {}

final class FetchNewReservationLoaded extends FetchNewReservationState {
  final ReservationModel reservation;

  const FetchNewReservationLoaded({required this.reservation});
}

final class FetchNewReservationFailed extends FetchNewReservationState {
  final String errorMessage;

  const FetchNewReservationFailed({required this.errorMessage});
}
