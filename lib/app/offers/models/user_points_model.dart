import 'package:clinic_app/core/api/end_points.dart';

class UserPointsModel {
  final num points;

  UserPointsModel({required this.points});

  factory UserPointsModel.fromJson(Map<String, dynamic> jsonData) {
    return UserPointsModel(points: jsonData[ApiKey.points]);
  }
}
