class MedicalReportModel {
  final int id;
  final String medicalReport;

  MedicalReportModel({required this.id, required this.medicalReport});

  factory MedicalReportModel.fromJson(Map<String, dynamic> jsonData) {
    return MedicalReportModel(
      id: jsonData['id'],
      medicalReport: jsonData['medical_report'],
    );
  }
}
