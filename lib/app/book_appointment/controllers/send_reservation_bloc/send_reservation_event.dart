part of 'send_reservation_bloc.dart';

sealed class SendReservationEvent {}

class SendReservation extends SendReservationEvent {
  final ReservationModel reservation;
  SendReservation({required this.reservation});
}

class SendOfferReservation extends SendReservationEvent {
  final int offerId;
  final ReservationModel reservation;

  SendOfferReservation({required this.offerId, required this.reservation});
}
