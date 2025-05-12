class TimeModel {
  final int id;
  final String name;
  final bool isAvailable;

  TimeModel({required this.id, required this.name, required this.isAvailable});

  factory TimeModel.fromJson(Map<String, dynamic> jsonData) {
    return TimeModel(
      id: jsonData['id'],
      name: jsonData['name'],
      isAvailable: jsonData['isAvailable'],
    );
  }
}
