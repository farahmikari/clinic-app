part of 'fetch_appointments_bloc.dart';

sealed class FetchAppointmentsEvent {
  const FetchAppointmentsEvent();
}

final class FetchAppointments extends FetchAppointmentsEvent {}

final class DisplayAllAppointments extends FetchAppointmentsEvent {}

final class DisplayPendingAppointments extends FetchAppointmentsEvent {}

final class DisplayCompletedAppointments extends FetchAppointmentsEvent {}
