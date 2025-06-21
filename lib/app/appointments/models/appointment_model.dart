class AppointmentModel {
  final int id;
  final String shift;
  final String status;
  final String doctorName;
  final String doctorImage;
  final String department;
  final DateTime dateTime;
  final int requestTypeId;
  final bool withMedicalReport;

  AppointmentModel({
    required this.id,
    required this.shift,
    required this.status,
    required this.doctorName,
    required this.doctorImage,
    required this.department,
    required this.dateTime,
    required this.requestTypeId,
    required this.withMedicalReport,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return AppointmentModel(
      id: jsonData["id"],
      shift: jsonData["shift"],
      status: jsonData["status"],
      doctorName: jsonData["doctor_name"],
      doctorImage: jsonData["doctor_image"],
      department: jsonData["department"],
      dateTime: DateTime.parse(jsonData["date_time"]),
      requestTypeId: jsonData["request_type_id"],
      withMedicalReport: jsonData["with_medical_report"],
    );
  }
}
