class UserPointsModel {
  final num points;

  UserPointsModel({required this.points});

  factory UserPointsModel.fromJson(Map<String, dynamic> jsonData) {
    return UserPointsModel(points: jsonData['points']);
  }
}
