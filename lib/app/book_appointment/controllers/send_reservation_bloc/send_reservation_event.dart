part of 'send_reservation_bloc.dart';

sealed class SendReservationEvent {}

class SendReservation extends SendReservationEvent {
  final ReservationModel reservation;
  SendReservation({required this.reservation});
}

class SendOfferReservation extends SendReservationEvent {
  final OfferReservationModel offerReservation;

  SendOfferReservation({required this.offerReservation});
}
