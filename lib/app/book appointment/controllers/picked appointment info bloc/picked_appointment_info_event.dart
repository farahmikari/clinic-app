part of 'picked_appointment_info_bloc.dart';

sealed class PickedAppointmentInfoEvent {}

final class DepartmentIdChanged extends PickedAppointmentInfoEvent {
  final int pickedDepartmentId;

  DepartmentIdChanged({required this.pickedDepartmentId});
}

final class RequestTypeIdChanged extends PickedAppointmentInfoEvent {
  final int pickedRequestTypeId;

  RequestTypeIdChanged({required this.pickedRequestTypeId});
}

final class RequestTypesDrawToggled extends PickedAppointmentInfoEvent {}

final class DayIdChanged extends PickedAppointmentInfoEvent {
  final int pickedDayId;

  DayIdChanged({required this.pickedDayId});
}

final class TimeIdChanged extends PickedAppointmentInfoEvent {
  final int pickedDoctorId;
  final int pickedTimeId;

  TimeIdChanged({required this.pickedTimeId, required this.pickedDoctorId});
}

final class MorningTimesLengthChanged extends PickedAppointmentInfoEvent {
  final int morningTimesLength;

  MorningTimesLengthChanged({required this.morningTimesLength});
}

final class AfternoonTimesLengthChanged extends PickedAppointmentInfoEvent {
  final int afternoonTimesLength;

  AfternoonTimesLengthChanged({required this.afternoonTimesLength});
}

final class WithMedicalReportToggled extends PickedAppointmentInfoEvent {
  final bool withMedicalReport;

  WithMedicalReportToggled({required this.withMedicalReport});
}

final class ToggleConfirm extends PickedAppointmentInfoEvent {}
