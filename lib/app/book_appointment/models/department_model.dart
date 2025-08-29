import 'package:clinic_app/core/api/end_points.dart';

class DepartmentModel {
  final int id;
  final String name;
  final int morningDoctorsCount;
  final int afternoonDoctorsCount;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.morningDoctorsCount,
    required this.afternoonDoctorsCount,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> jsonData) {
    return DepartmentModel(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
      morningDoctorsCount: jsonData[ApiKey.morningDoctorsCount],
      afternoonDoctorsCount: jsonData[ApiKey.afternoonDoctorsCount],
    );
  }
}
