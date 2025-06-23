part of 'fetch_completed_appointment_details_bloc.dart';

sealed class FetchCompletedAppointmentDetailsEvent {}

class FetchCompletedAppointmentDetails
    extends FetchCompletedAppointmentDetailsEvent {
  final int appointmentId;
  FetchCompletedAppointmentDetails({required this.appointmentId});
}
