part of 'upcoming_validator_bloc.dart';

sealed class UpcomingValidatorEvent {}

class IsReservationEditingIsToggled extends UpcomingValidatorEvent {}

class CancelAbilityIsChecked extends UpcomingValidatorEvent {
  final int appointmentId;

  CancelAbilityIsChecked({required this.appointmentId});
}

class EditAbilityIsChecked extends UpcomingValidatorEvent {
  final int? departmentId;
  final int? doctorId;
  final int? requestTypeId;
  final String? day;
  final int? timeId;
  final bool? withMedicalReport;

  EditAbilityIsChecked({
    this.departmentId,
    this.doctorId,
    this.requestTypeId,
    this.day,
    this.timeId,
    this.withMedicalReport,
  });
}

class CurrentAndPreviousReservationAreSet extends UpcomingValidatorEvent {
  final ReservationModel currentAndPreviousreservation;

  CurrentAndPreviousReservationAreSet({
    required this.currentAndPreviousreservation,
  });
}
