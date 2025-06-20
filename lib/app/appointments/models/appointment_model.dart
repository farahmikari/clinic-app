class AppointmentModel {
  final int id;
  final String status;
  final String doctorName;
  final String doctorImage;
  final String department;
  final DateTime date;
  final String time;
  final String requestType;
  final bool withMedicalReport;

  AppointmentModel({
    required this.id,
    required this.status,
    required this.doctorName,
    required this.doctorImage,
    required this.department,
    required this.date,
    required this.time,
    required this.requestType,
    required this.withMedicalReport,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return AppointmentModel(
      id: jsonData["id"],
      status: jsonData["status"],
      doctorName: jsonData["doctor_name"],
      doctorImage: jsonData["doctor_image"],
      department: jsonData["department"],
      date: DateTime.parse(jsonData["date"]),
      time: jsonData["time"],
      requestType: jsonData["request_type"],
      withMedicalReport: jsonData["with_medical_report"],
    );
  }
}
