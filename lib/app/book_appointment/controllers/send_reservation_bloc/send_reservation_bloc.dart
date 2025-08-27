import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_reservation_event.dart';
part 'send_reservation_state.dart';

class SendReservationBloc
    extends Bloc<SendReservationEvent, SendReservationState> {
  SendReservationBloc() : super(SendReservationInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<SendReservation>((event, emit) async {
      emit(SendReservationLoading());
      try {
        if (event.reservation.offerId != null) {
          await api.post(
            EndPoints.appointments,
            data: {
              ApiKey.offerId: event.reservation.offerId,
              ApiKey.reservation: event.reservation.toJson(),
            },
          );
        } else {
          await api.post(
            EndPoints.appointments,
            data: event.reservation.toJson(),
          );
        }
        emit(SendReservationLoaded());
      } on ServerException catch (e) {
        emit(SendReservationFailed(errorMessage: e.errorModel.errorMessage));
      }
    });

    on<SendCancelReservation>((event, emit) async {
      emit(SendReservationLoading());
      try {
        await api.delete(EndPoints.appointmentId(event.appointmentId));
        emit(SendReservationLoaded());
      } on ServerException catch (e) {
        emit(SendReservationFailed(errorMessage: e.errorModel.errorMessage));
      }
    });

    on<SendEditReservation>((event, emit) async {
      emit(SendReservationLoading());
      try {
        await api.put(
          EndPoints.appointmentId(event.appointmentId),
          data: event.reservation.toJson(),
        );
        emit(SendReservationLoaded());
      } on ServerException catch (e) {
        emit(SendReservationFailed(errorMessage: e.errorModel.errorMessage));
      }
    });
  }
}
