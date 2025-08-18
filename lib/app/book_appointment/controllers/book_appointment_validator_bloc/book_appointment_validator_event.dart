part of 'book_appointment_validator_bloc.dart';

sealed class BookAppointmentValidatorEvent {}

class CheckConfirmAbility extends BookAppointmentValidatorEvent {
  final int? offerId;
  final int? departmentId;
  final int? doctorId;
  final int? requestTypeId;
  final String? day;
  final int? timeId;
  final bool? withMedicalReport;

  CheckConfirmAbility({
    this.offerId,
    this.departmentId,
    this.doctorId,
    this.requestTypeId,
    this.day,
    this.timeId,
    this.withMedicalReport,
  });
}
