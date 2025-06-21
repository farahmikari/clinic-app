import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
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
        await api.post(
          EndPoints.appointments,
          data: {
            "department_id": event.reservation.departmentId,
            "doctor_id": event.reservation.doctorId,
            "slot_id": event.reservation.timeId,
            "date": event.reservation.day,
            "request_type_id": event.reservation.requestTypeId,
            "with_medical_report": event.reservation.withMedicalReport,
          },
        );
        event.reservation;
        emit(SendReservationLoaded());
      } catch (e) {
        emit(
          SendReservationFailed(
            errorMessage:
                "Something Went Wrong When Trying To Send Reservation",
          ),
        );
      }
    });
  }
}
