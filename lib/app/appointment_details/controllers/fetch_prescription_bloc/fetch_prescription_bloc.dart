import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/completed_appointment_model.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_prescription_event.dart';
part 'fetch_prescription_state.dart';

class FetchPrescriptionBloc
    extends Bloc<FetchPrescriptionEvent, FetchPrescriptionState> {
  FetchPrescriptionBloc() : super(FetchPrescriptionLoading()) {
    on<FetchPrescription>((event, emit) async {
      emit(FetchPrescriptionLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        PrescriptionModel prescription = PrescriptionModel.fromJson(
          completedAppointmentsDetails[ /*event.appointmentId*/ 1]
              as Map<String, dynamic>,
        );
        emit(FetchPrescriptionLoaded(prescription: prescription));
      } catch (e) {
        emit(
          FetchPrescriptionFailed(
            errorMessage:
                "Something Went Wrong When Try To Fetch Completed Appointment Details",
          ),
        );
      }
    });
  }
}
