class TimeModel {
  final int id;
  final String time;
  final bool isAvailable;

  TimeModel({required this.id, required this.time, required this.isAvailable});

  factory TimeModel.fromJson(Map<String, dynamic> jsonData) {
    return TimeModel(
      id: jsonData["id"],
      time: jsonData["time"],
      isAvailable: jsonData["isAvailable"],
    );
  }
}
