part of 'send_cancel_or_edit_reservation_bloc.dart';

sealed class SendCancelOrEditReservationEvent {}

class SendCancelReservation extends SendCancelOrEditReservationEvent {
  final int appointmentId;

  SendCancelReservation({required this.appointmentId});
}

class SendEditReservation extends SendCancelOrEditReservationEvent {
  final int appointmentId;
  final ReservationModel reservation;

  SendEditReservation({required this.appointmentId, required this.reservation});
}
