import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';

part 'send_cancel_or_edit_reservation_event.dart';
part 'send_cancel_or_edit_reservation_state.dart';

class SendCancelOrEditReservationBloc
    extends
        Bloc<
          SendCancelOrEditReservationEvent,
          SendCancelOrEditReservationState
        > {
  SendCancelOrEditReservationBloc()
    : super(SendCancelOrEditReservationInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());

    on<SendCancelReservation>((event, emit) async {
      emit(SendCancelOrEditReservationLoading());
      try {
        await api.delete(EndPoints.appointmentId(event.appointmentId));
        emit(SendCancelOrEditReservationLoaded());
      } on ServerException catch (e) {
        emit(
          SendCancelOrEditReservationFailed(
            errorMessage: e.errorModel.errorMessage,
          ),
        );
      }
    });

    on<SendEditReservation>((event, emit) async {
      emit(SendCancelOrEditReservationLoading());
      try {
        await api.put(
          EndPoints.appointmentId(event.appointmentId),
          data: event.reservation.toJson(),
        );
        emit(SendCancelOrEditReservationLoaded());
      } on ServerException catch (e) {
        emit(
          SendCancelOrEditReservationFailed(
            errorMessage: e.errorModel.errorMessage,
          ),
        );
      }
    });
  }
}
