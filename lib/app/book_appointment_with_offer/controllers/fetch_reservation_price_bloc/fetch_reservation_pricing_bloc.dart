import 'package:clinic_app/app/book_appointment_with_offer/models/pricing_model.dart';
import 'package:clinic_app/app/book_appointment_with_offer/models/request_offer_cash_price_model.dart';
import 'package:clinic_app/app/book_appointment_with_offer/models/request_offer_points_price_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_reservation_pricing_event.dart';
part 'fetch_reservation_pricing_state.dart';

class FetchReservationPricingBloc
    extends Bloc<FetchReservationPricingEvent, FetchReservationPricingState> {
  FetchReservationPricingBloc() : super(FetchReservationPricingInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<FetchReservationCashOfferPricing>((event, emit) async {
      emit(FetchReservationPricingLoading());
      try {
        final response = await api.get(
          EndPoints.offerPrice,
          data: event.requestOfferCashPrice.toJson(),
        );
        PricingModel pricing = PricingModel.fromJson(response);
        emit(FetchReservationPricingLoaded(pricing: pricing));
      } catch (e) {
        emit(FetchReservationPricingFailed(errorMessage: e.toString()));
      }
    });

    on<FetchReservationPointsOfferPricing>((event, emit) async {
      emit(FetchReservationPricingLoading());
      try {
        final response = await api.get(
          EndPoints.offerPrice,
          data: event.requestOfferPointsPrice.toJson(),
        );
        PricingModel pricing = PricingModel.fromJson(response);
        emit(FetchReservationPricingLoaded(pricing: pricing));
      } on ServerException catch (e) {
        emit(
          FetchReservationPricingFailed(
            errorMessage: e.errorModel.errorMessage,
          ),
        );
      }
    });
  }
}
