import 'package:clinic_app/core/api/end_points.dart';

class DepartmentModel {
  final int id;
  final String name;
  final int morningDoctorsCount; // new please ask to add this property
  final int afternoonDoctorsCount; // new please ask to add this property

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
      morningDoctorsCount: 3,
      afternoonDoctorsCount: 2,
    );
  }
}
