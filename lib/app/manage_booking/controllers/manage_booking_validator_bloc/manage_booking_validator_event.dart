part of 'manage_booking_validator_bloc.dart';

sealed class ManageBookingValidatorEvent {}

class IsReservationEditingIsToggled extends ManageBookingValidatorEvent {}

class CancelAbilityIsChecked extends ManageBookingValidatorEvent {
  final int appointmentId;

  CancelAbilityIsChecked({required this.appointmentId});
}

class EditAbilityIsChecked extends ManageBookingValidatorEvent {
  final int? requestTypeId;
  final String? day;
  final int? timeId;
  final bool? withMedicalReport;

  EditAbilityIsChecked({
    this.requestTypeId,
    this.day,
    this.timeId,
    this.withMedicalReport,
  });
}

class CurrentAndPreviousReservationAreSet extends ManageBookingValidatorEvent {
  final ReservationModel currentAndPreviousReservation;

  CurrentAndPreviousReservationAreSet({
    required this.currentAndPreviousReservation,
  });
}
