import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
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
        await api.delete(EndPoints.cancelAppointment(event.appointmentId));
        emit(SendCancelOrEditReservationLoaded());
      } catch (e) {
        emit(
          SendCancelOrEditReservationFailed(
            errorMessage:
                "Something went wrong when trying to cancel reservation",
          ),
        );
      }
    });

    on<SendEditReservation>((event, emit) async {
      emit(SendCancelOrEditReservationLoading());
      try {
        await api.put(
          EndPoints.editAppointment(event.appointmentId),
          data: {
            "department_id": event.reservation.departmentId,
            "doctor_id": event.reservation.doctorId,
            "slot_id": event.reservation.timeId,
            "date": event.reservation.day,
            "request_type_id": event.reservation.requestTypeId,
            "with_medical_report": event.reservation.withMedicalReport,
          },
        );
        emit(SendCancelOrEditReservationLoaded());
      } catch (e) {
        emit(
          SendCancelOrEditReservationFailed(
            errorMessage:
                "Something went wrong when trying to edit reservation",
          ),
        );
      }
    });
  }
}
