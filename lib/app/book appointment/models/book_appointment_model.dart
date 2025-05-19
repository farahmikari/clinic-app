class CustomizedAppointmentModel {
  final int departmentId;
  final int doctorId;
  final int requestTypeId;
  final int dayId;
  final int timeId;
  final bool withMedicalReport;

  CustomizedAppointmentModel({
    required this.departmentId,
    required this.doctorId,
    required this.requestTypeId,
    required this.dayId,
    required this.timeId,
    required this.withMedicalReport,
  });

  Map<String, dynamic> toJson() {
    return {
      "department_id": departmentId,
      "doctor_id": doctorId,
      "request_type_id": requestTypeId,
      "day_id": dayId,
      "time_id": timeId,
      "with_medical_report": withMedicalReport,
    };
  }
}
