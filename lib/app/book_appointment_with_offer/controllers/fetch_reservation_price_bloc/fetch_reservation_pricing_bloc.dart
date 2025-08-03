import 'dart:convert';
import 'dart:developer';

import 'package:clinic_app/app/book_appointment_with_offer/models/json_model.dart';
import 'package:clinic_app/app/book_appointment_with_offer/models/pricing_model.dart';
import 'package:clinic_app/app/book_appointment_with_offer/models/selected_service_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_reservation_pricing_event.dart';
part 'fetch_reservation_pricing_state.dart';

class FetchReservationPricingBloc
    extends Bloc<FetchReservationPricingEvent, FetchReservationPricingState> {
  FetchReservationPricingBloc() : super(FetchReservationPricingInitial()) {
    on<FetchReservationCashOfferPricing>((event, emit) async {
      emit(FetchReservationPricingLoading());
      await Future.delayed(Duration(seconds: 3));
      try {
        log(
          jsonEncode({
            "offer_id": event.offerId,
            "selected_service": event.selectedService.toJson(),
          }),
        );
        PricingModel pricing = PricingModel.fromJson(
          cashOffersPricing[event.offerId],
        );
        emit(FetchReservationPricingLoaded(pricing: pricing));
      } catch (e) {
        emit(FetchReservationPricingFailed(errorMessage: e.toString()));
      }
    });

    on<FetchReservationPointsOfferPricing>((event, emit) async {
      emit(FetchReservationPricingLoading());
      await Future.delayed(Duration(seconds: 3));
      try {
        PricingModel pricing = PricingModel.fromJson(
          pointsOffersPricing[event.offerId],
        );
        emit(FetchReservationPricingLoaded(pricing: pricing));
      } catch (e) {
        emit(FetchReservationPricingFailed(errorMessage: e.toString()));
      }
    });
  }
}
