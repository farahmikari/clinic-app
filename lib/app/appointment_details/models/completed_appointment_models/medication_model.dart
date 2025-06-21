class MedicationModel {
  final int id;
  final String name;
  final String type;
  final String dosage;
  final String frequency;
  final String duration;
  final String note;

  MedicationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dosage,
    required this.frequency,
    required this.duration,
    required this.note,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> jsonData) {
    return MedicationModel(
      id: jsonData["id"],
      name: jsonData["name"],
      type: jsonData["type"],
      dosage: jsonData["dosage"],
      frequency: jsonData["frequency"],
      duration: jsonData["duration"],
      note: jsonData["note"],
    );
  }
}
