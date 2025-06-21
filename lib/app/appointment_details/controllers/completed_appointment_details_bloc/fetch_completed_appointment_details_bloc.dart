import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/completed_appointment_model.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_completed_appointment_details_event.dart';
part 'fetch_completed_appointment_details_state.dart';

class FetchCompletedAppointmentDetailsBloc
    extends
        Bloc<
          FetchCompletedAppointmentDetailsEvent,
          FetchCompletedAppointmentDetailsState
        > {
  FetchCompletedAppointmentDetailsBloc()
    : super(FetchCompletedAppointmentDetailsLoading()) {
    on<FetchCompletedAppointmentDetails>((event, emit) async {
      emit(FetchCompletedAppointmentDetailsLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        CompletedAppointmentModel completedAppointment =
            CompletedAppointmentModel.fromJson(
              completedAppointmentsDetails[event.appointmentId]
                  as Map<String, dynamic>,
            );
        emit(
          FetchCompletedAppointmentDetailsLoaded(
            completedAppointment: completedAppointment,
          ),
        );
      } catch (e) {
        emit(
          FetchCompletedAppointmentDetailsFailed(
            errorMessage:
                "Something Went Wrong When Try To Fetch Completed Appointment Details",
          ),
        );
      }
    });
  }
}
