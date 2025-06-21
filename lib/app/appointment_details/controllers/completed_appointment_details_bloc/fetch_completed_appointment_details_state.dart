part of 'fetch_completed_appointment_details_bloc.dart';

sealed class FetchCompletedAppointmentDetailsState {}

final class FetchCompletedAppointmentDetailsLoading
    extends FetchCompletedAppointmentDetailsState {}

final class FetchCompletedAppointmentDetailsLoaded
    extends FetchCompletedAppointmentDetailsState {
  final CompletedAppointmentModel completedAppointment;
  FetchCompletedAppointmentDetailsLoaded({required this.completedAppointment});
}

final class FetchCompletedAppointmentDetailsFailed
    extends FetchCompletedAppointmentDetailsState {
  final String errorMessage;
  FetchCompletedAppointmentDetailsFailed({required this.errorMessage});
}
