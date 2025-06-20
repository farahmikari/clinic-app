part of 'picked_appointment_info_bloc.dart';

sealed class PickedAppointmentInfoState {
  final int pickedDepartmentId;
  final int pickedDoctorId;
  final int pickedDayId;
  final int pickedTimeId;
  final int pickedRequestTypeId;
  final int morningTimesLength;
  final int afternoonTimesLength;
  final bool drawRequestTypes;
  final bool withMedicalReport;
  final bool confirm;

  PickedAppointmentInfoState({
    required this.pickedDepartmentId,
    required this.pickedDoctorId,
    required this.pickedDayId,
    required this.pickedTimeId,
    required this.pickedRequestTypeId,
    required this.morningTimesLength,
    required this.afternoonTimesLength,
    required this.drawRequestTypes,
    required this.withMedicalReport,
    required this.confirm,
  });
}

final class PickedAppointmentInfoInitial extends PickedAppointmentInfoState {
  PickedAppointmentInfoInitial()
    : super(
        pickedDepartmentId: -1,
        pickedDoctorId: -1,
        pickedDayId: -1,
        pickedTimeId: -1,
        pickedRequestTypeId: -1,
        morningTimesLength: 6,
        afternoonTimesLength: 6,
        drawRequestTypes: false,
        withMedicalReport: false,
        confirm: false,
      );
}

final class UpdatePickedValues extends PickedAppointmentInfoState {
  UpdatePickedValues({
    required super.pickedDepartmentId,
    required super.pickedDoctorId,
    required super.pickedDayId,
    required super.pickedTimeId,
    required super.pickedRequestTypeId,
    required super.morningTimesLength,
    required super.afternoonTimesLength,
    required super.drawRequestTypes,
    required super.withMedicalReport,
    required super.confirm,
  });
}
