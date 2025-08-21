part of 'send_reservation_bloc.dart';

sealed class SendReservationEvent {}

class SendReservation extends SendReservationEvent {
  final ReservationModel reservation;
  SendReservation({required this.reservation});
}

class SendCancelReservation extends SendReservationEvent {
  final int appointmentId;
  SendCancelReservation({required this.appointmentId});
}

class SendEditReservation extends SendReservationEvent {
  final int appointmentId;
  final ReservationModel reservation;

  SendEditReservation({required this.appointmentId, required this.reservation});
}
