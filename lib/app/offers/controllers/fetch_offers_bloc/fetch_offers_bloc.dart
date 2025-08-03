import 'package:clinic_app/app/offers/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/offers/models/offer_model.dart';

part 'fetch_offers_event.dart';
part 'fetch_offers_state.dart';

class FetchOffersBloc extends Bloc<FetchOffersEvent, FetchOffersState> {
  FetchOffersBloc() : super(FetchOffersLoading()) {
    on<FetchOffers>((event, emit) async {
      emit(FetchOffersLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        List<OfferModel> offers =
            myOffers.map((offer) => OfferModel.fromJson(offer)).toList();
        emit(FetchOffersLoaded(offers: offers));
      } catch (e) {
        emit(FetchOffersFailed(errorMessage: e.toString()));
      }
    });
  }
}
