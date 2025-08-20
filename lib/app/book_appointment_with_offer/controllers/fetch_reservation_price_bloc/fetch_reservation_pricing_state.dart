part of 'fetch_reservation_pricing_bloc.dart';

sealed class FetchReservationPricingState {}

final class FetchReservationPricingInitial
    extends FetchReservationPricingState {}

final class FetchReservationPricingLoading
    extends FetchReservationPricingState {}

final class FetchReservationPricingLoaded extends FetchReservationPricingState {
  final PricingModel pricing;

  FetchReservationPricingLoaded({required this.pricing});
}

final class FetchReservationPricingFailed extends FetchReservationPricingState {
  final String errorMessage;
  FetchReservationPricingFailed({required this.errorMessage});
}
