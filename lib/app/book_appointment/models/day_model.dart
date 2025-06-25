import 'package:clinic_app/core/api/end_points.dart';

class DayModel {
  final int id;
  final String day;
  final bool isAvailable;

  DayModel({required this.id, required this.day, required this.isAvailable});

  factory DayModel.fromJson(Map<String, dynamic> jsonData) {
    return DayModel(
      id: jsonData[ApiKey.id],
      day: jsonData[ApiKey.day],
      isAvailable: jsonData[ApiKey.isAvailable],
    );
  }
}
