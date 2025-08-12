part of 'fetch_new_reservation_bloc.dart';

sealed class FetchNewReservationEvent extends Equatable {
  const FetchNewReservationEvent();

  @override
  List<Object> get props => [];
}

final class NewReservationIsFetched extends FetchNewReservationEvent {
  final int appointmentId;

  const NewReservationIsFetched({required this.appointmentId});
}
