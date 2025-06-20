class DayModel {
  final int id;
  final DateTime date;
  final bool isAvailable;

  DayModel({required this.id, required this.date, required this.isAvailable});

  factory DayModel.fromJson(Map<String, dynamic> jsonData) {
    return DayModel(
      id: jsonData['id'],
      date: DateTime.parse(jsonData['date']),
      isAvailable: jsonData['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'isAvailable': isAvailable,
      };
}
