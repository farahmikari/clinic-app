part of 'fetch_appointments_bloc.dart';

sealed class FetchAppointmentsState {
  const FetchAppointmentsState();
}

final class FetchAppointmentsLoading extends FetchAppointmentsState {}

final class FetchAppointmentsLoaded extends FetchAppointmentsState {
  final List<AppointmentModel> appointments;

  FetchAppointmentsLoaded({required this.appointments});
}

final class FetchAppointmentsFailed extends FetchAppointmentsState {
  final String errorMessage;

  FetchAppointmentsFailed({required this.errorMessage});
}
