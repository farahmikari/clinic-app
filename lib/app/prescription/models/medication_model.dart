import 'package:clinic_app/core/api/end_points.dart';

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
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
      type: jsonData[ApiKey.type],
      dosage: jsonData[ApiKey.dosage],
      frequency: jsonData[ApiKey.frequesncy],
      duration: jsonData[ApiKey.duration],
      note: jsonData[ApiKey.note],
    );
  }
}
