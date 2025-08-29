import 'dart:developer';

import 'package:clinic_app/app/book_appointment/controllers/fetch_reservation_price_bloc/fetch_reservation_pricing_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/pricing_model.dart';
import 'package:clinic_app/app/book_appointment/models/request_reservation_pricing_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FetchReservationPricingBloc
    extends Bloc<FetchReservationPricingEvent, FetchReservationPricingState> {
  FetchReservationPricingBloc() : super(FetchReservationPricingInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());

    on<FetchReservationPricing>((event, emit) async {
      emit(FetchReservationPricingLoading());
      try {
        RequestReservationPricingModel requestReservationPricing =
            RequestReservationPricingModel.fromJson(event.reservation.toJson());
        log(requestReservationPricing.toJson().toString());
        final response = await api.get(
          EndPoints.offerPrice,
          data: requestReservationPricing.toJson(),
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
