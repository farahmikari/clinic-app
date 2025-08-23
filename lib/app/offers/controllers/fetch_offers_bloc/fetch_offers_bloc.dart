import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/offers/models/offer_model.dart';

part 'fetch_offers_event.dart';
part 'fetch_offers_state.dart';

class FetchOffersBloc extends Bloc<FetchOffersEvent, FetchOffersState> {
  FetchOffersBloc() : super(FetchOffersLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<FetchOffers>((event, emit) async {
      emit(FetchOffersLoading());
      try {
        final response = await api.get(EndPoints.offers);
        List<OfferModel> offers =
            (response as List<dynamic>)
                .map((offer) => OfferModel.fromJson(offer))
                .toList();
        if (offers.isEmpty) {
          emit(FetchOffersLoadedEmpty());
        } else {
          emit(FetchOffersLoaded(offers: offers));
        }
      } on ServerException catch (e) {
        emit(FetchOffersFailed(errorMessage: e.errorModel.errorMessage));
      }
    });
  }
}
