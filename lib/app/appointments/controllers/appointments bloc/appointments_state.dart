part of 'appointments_bloc.dart';

sealed class AppointmentsState {
  const AppointmentsState();
}

//final class AppointmentsInitial extends AppointmentsState {}

final class AppointmentsLoading extends AppointmentsState {}

final class AppointmentsLoaded extends AppointmentsState {
  final List<AppointmentModel> appointments;

  AppointmentsLoaded({required this.appointments});
}

final class AppointmentsFailed extends AppointmentsState {
  final String errorMessage;

  AppointmentsFailed({required this.errorMessage});
}
