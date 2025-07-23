part of 'appointments_bloc.dart';

sealed class AppointmentsEvent {
  const AppointmentsEvent();
}

final class FetchAppointments extends AppointmentsEvent {}

final class DisplayAllAppointments extends AppointmentsEvent {}

final class DisplayPendingAppointments extends AppointmentsEvent {}

final class DisplayCompletedAppointments extends AppointmentsEvent {}
