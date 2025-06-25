import 'package:clinic_app/core/api/end_points.dart';

class TimeModel {
  final int id;
  final String time;
  final bool isAvailable;

  TimeModel({required this.id, required this.time, required this.isAvailable});

  factory TimeModel.fromJson(Map<String, dynamic> jsonData) {
    return TimeModel(
      id: jsonData[ApiKey.id],
      time: jsonData[ApiKey.time],
      isAvailable: jsonData[ApiKey.isAvailable],
    );
  }
}
