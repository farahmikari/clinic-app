part of 'fetch_offers_bloc.dart';

sealed class FetchOffersState {}

final class FetchOffersLoading extends FetchOffersState {}

final class FetchOffersLoaded extends FetchOffersState {
  final List<OfferModel> offers;

  FetchOffersLoaded({required this.offers});
}

final class FetchOffersLoadedEmpty extends FetchOffersState {}

final class FetchOffersFailed extends FetchOffersState {
  final String errorMessage;

  FetchOffersFailed({required this.errorMessage});
}
