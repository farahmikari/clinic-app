import 'package:clinic_app/core/api/end_points.dart';

class AdviceModel {
  final int id;
  final String advice;

  AdviceModel({required this.id, required this.advice});

  factory AdviceModel.fromJson(Map<String, dynamic> jsonData) {
    return AdviceModel(
      id: jsonData[ApiKey.id],
      advice: jsonData[ApiKey.advice],
    );
  }
}
