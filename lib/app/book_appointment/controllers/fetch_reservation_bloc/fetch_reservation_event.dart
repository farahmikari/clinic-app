part of 'fetch_reservation_bloc.dart';

sealed class FetchReservationEvent {}

final class NewReservationIsFetched extends FetchReservationEvent {
  final int appointmentId;

  NewReservationIsFetched({required this.appointmentId});
}
