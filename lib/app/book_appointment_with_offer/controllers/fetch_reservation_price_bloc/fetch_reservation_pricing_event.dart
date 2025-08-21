part of 'fetch_reservation_pricing_bloc.dart';

sealed class FetchReservationPricingEvent {}

class FetchReservationPricing extends FetchReservationPricingEvent {
  final ReservationModel reservation;

  FetchReservationPricing({required this.reservation});
}
