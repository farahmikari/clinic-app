part of 'fetch_reservation_pricing_bloc.dart';

sealed class FetchReservationPricingEvent {}

class FetchReservationCashOfferPricing extends FetchReservationPricingEvent {
  final RequestOfferCashPriceModel requestOfferCashPrice;
  FetchReservationCashOfferPricing({required this.requestOfferCashPrice});
}

class FetchReservationPointsOfferPricing extends FetchReservationPricingEvent {
  final RequestOfferPointsPriceModel requestOfferPointsPrice;
  FetchReservationPointsOfferPricing({required this.requestOfferPointsPrice});
}
