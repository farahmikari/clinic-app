class DayModel {
  final int id;
  final String day;
  final bool isAvailable;

  DayModel({required this.id, required this.day, required this.isAvailable});

  factory DayModel.fromJson(Map<String, dynamic> jsonData) {
    return DayModel(
      id: jsonData['id'],
      day: jsonData['day'],
      isAvailable: jsonData['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'day': day,
    'isAvailable': isAvailable,
  };
}
 //DateTime.parse(jsonData['day'])
 //day.toIso8601String()