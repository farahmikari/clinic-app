class SurgeryModel {
  final int id;
  final String name;

  SurgeryModel({required this.id, required this.name});

  factory SurgeryModel.fromJson(Map<String, dynamic> jsonData) {
    return SurgeryModel(id: jsonData["id"], name: jsonData["name"]);
  }
}
