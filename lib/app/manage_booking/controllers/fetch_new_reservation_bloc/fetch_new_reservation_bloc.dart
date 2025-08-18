import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:equatable/equatable.dart';

part 'fetch_new_reservation_event.dart';
part 'fetch_new_reservation_state.dart';

class FetchNewReservationBloc
    extends Bloc<FetchNewReservationEvent, FetchNewReservationState> {
  FetchNewReservationBloc() : super(FetchNewReservationLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<NewReservationIsFetched>((event, emit) async {
      try {
        final response = await api.get(
          EndPoints.appointmentId(event.appointmentId),
        );
        final ReservationModel reservation = ReservationModel.fromJson(
          response as Map<String, dynamic>,
        );
        emit(FetchNewReservationLoaded(reservation: reservation));
      } catch (e) {
        emit(FetchNewReservationFailed(errorMessage: e.toString()));
      }
    });
  }
}
