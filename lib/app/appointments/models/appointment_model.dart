import 'package:clinic_app/core/api/end_points.dart';

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
      id: jsonData[ApiKey.id],
      shift: jsonData[ApiKey.shift],
      status: jsonData[ApiKey.status],
      doctorName: jsonData[ApiKey.doctorName],
      doctorImage: jsonData[ApiKey.doctorImage],
      department: jsonData[ApiKey.department],
      dateTime: DateTime.parse(jsonData[ApiKey.dateTime]),
      requestTypeId: jsonData[ApiKey.requestTypeId],
      withMedicalReport: jsonData[ApiKey.withMedicalReport],
    );
  }
}
