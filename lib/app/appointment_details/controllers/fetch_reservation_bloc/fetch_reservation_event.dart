part of 'fetch_reservation_bloc.dart';

sealed class FetchReservationEvent {}

class FetchReservation extends FetchReservationEvent {
  final int appointmentId;

  FetchReservation({required this.appointmentId});
}
