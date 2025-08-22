class SelectedServiceModel {
  final int requestTypeId;
  final bool withMedicalReport;

  SelectedServiceModel({
    required this.requestTypeId,
    required this.withMedicalReport,
  });

  factory SelectedServiceModel.fromJson(Map<String, dynamic> jsonData) {
    return SelectedServiceModel(
      requestTypeId: jsonData['request_type_id'],
      withMedicalReport: jsonData['with_medical_report'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "request_type_id": requestTypeId,
      "with_medical_report": withMedicalReport,
    };
  }
}
