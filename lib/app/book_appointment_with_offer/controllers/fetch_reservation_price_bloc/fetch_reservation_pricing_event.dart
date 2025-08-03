part of 'fetch_reservation_pricing_bloc.dart';

sealed class FetchReservationPricingEvent {}

class FetchReservationCashOfferPricing extends FetchReservationPricingEvent {
  final int offerId;
  final SelectedServiceModel selectedService;

  FetchReservationCashOfferPricing({
    required this.offerId,
    required this.selectedService,
  });
}

class FetchReservationPointsOfferPricing extends FetchReservationPricingEvent {
  final int offerId;
  FetchReservationPointsOfferPricing({required this.offerId});
}
