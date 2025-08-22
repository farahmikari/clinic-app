part of 'fetch_reservation_bloc.dart';

sealed class FetchReservationEvent extends Equatable {
  const FetchReservationEvent();

  @override
  List<Object> get props => [];
}

final class NewReservationIsFetched extends FetchReservationEvent {
  final int appointmentId;

  const NewReservationIsFetched({required this.appointmentId});
}
