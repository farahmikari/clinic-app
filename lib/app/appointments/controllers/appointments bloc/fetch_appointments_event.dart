part of 'fetch_appointments_bloc.dart';

sealed class FetchAppointmentsEvent {
  const FetchAppointmentsEvent();
}

final class FetchAppointments extends FetchAppointmentsEvent {
  final String? searchWord;
  final int? filterIndex;

  FetchAppointments({this.searchWord, this.filterIndex});
}

final class DisplayAllAppointments extends FetchAppointmentsEvent {}

final class DisplayPendingAppointments extends FetchAppointmentsEvent {}

final class DisplayCompletedAppointments extends FetchAppointmentsEvent {}
