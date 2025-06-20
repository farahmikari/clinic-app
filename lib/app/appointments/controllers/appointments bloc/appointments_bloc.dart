import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/appointments/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc() : super(AppointmentsLoading()) {
    List<AppointmentModel> myUpcomingAppointments = [];
    List<AppointmentModel> myCompletedAppointments = [];
    List<AppointmentModel> allAppointments = [];

    on<FetchAppointments>((event, emit) async {
      emit(AppointmentsLoading());
      await Future.delayed(const Duration(seconds: 2));
      try {
        myUpcomingAppointments =
            upcomingAppointments
                .map(
                  (upcomingAppointment) =>
                      AppointmentModel.fromJson(upcomingAppointment),
                )
                .toList();

        myCompletedAppointments =
            completedAppointments
                .map(
                  (completedAppointment) =>
                      AppointmentModel.fromJson(completedAppointment),
                )
                .toList();
        allAppointments = [
          ...myUpcomingAppointments,
          ...myCompletedAppointments,
        ];
        emit(AppointmentsLoaded(appointments: allAppointments));
      } catch (e) {
        emit(
          AppointmentsFailed(
            errorMessage: 'Something Went Wrong When Trying To Fetch Days',
          ),
        );
      }
    });

    on<DisplayAllAppointments>((event, emit) async {
      emit(AppointmentsLoaded(appointments: allAppointments));
    });

    on<DisplayUpcomingAppointments>((event, emit) async {
      emit(AppointmentsLoaded(appointments: myUpcomingAppointments));
    });

    on<DisplayCompletedAppointments>((event, emit) async {
      emit(AppointmentsLoaded(appointments: myCompletedAppointments));
    });
  }
}
