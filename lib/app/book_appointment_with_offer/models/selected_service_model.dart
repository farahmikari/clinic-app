class SelectedServiceModel {
  final int requestTypeId;
  final bool withMedicalReport;

  SelectedServiceModel({
    required this.requestTypeId,
    required this.withMedicalReport,
  });

  SelectedServiceModel copyWith({int? requestTypeId, bool? withMedicalReport}) {
    return SelectedServiceModel(
      requestTypeId: requestTypeId ?? this.requestTypeId,
      withMedicalReport: withMedicalReport ?? this.withMedicalReport,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "request_type_id": requestTypeId,
      "with_medical_report": withMedicalReport,
    };
  }
}
