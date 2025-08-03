import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/completed_appointment_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_prescription_event.dart';
part 'fetch_prescription_state.dart';

class FetchPrescriptionBloc
    extends Bloc<FetchPrescriptionEvent, FetchPrescriptionState> {
  FetchPrescriptionBloc() : super(FetchPrescriptionLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<FetchPrescription>((event, emit) async {
      emit(FetchPrescriptionLoading());
      try {
        var response = await api.get(
          EndPoints.prescriptionId(event.appointmentId),
        );
        PrescriptionModel prescription = PrescriptionModel.fromJson(response);
        emit(FetchPrescriptionLoaded(prescription: prescription));
        // await Future.delayed(Duration(seconds: 2));
        // PrescriptionModel prescription = PrescriptionModel.fromJson(
        //   completedAppointmentsDetails[ /*event.appointmentId*/ 1]
        //       as Map<String, dynamic>,
        // );
        // emit(FetchPrescriptionLoaded(prescription: prescription));
      } catch (e) {
        emit(FetchPrescriptionLoading());
        // emit(
        //   FetchPrescriptionFailed(
        //     errorMessage:
        //         "Something Went Wrong When Try To Fetch Completed Appointment Details",
        //   ),
        // );
      }
    });
  }
}
