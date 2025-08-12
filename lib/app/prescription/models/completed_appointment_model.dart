import 'package:clinic_app/app/prescription/models/advice_model.dart';
import 'package:clinic_app/app/prescription/models/lab_test_model.dart';
import 'package:clinic_app/app/prescription/models/medication_model.dart';
import 'package:clinic_app/app/prescription/models/surgery_model.dart';
import 'package:clinic_app/core/api/end_points.dart';

class PrescriptionModel {
  final List<MedicationModel> medications;
  final List<LabTestModel> labTests;
  final List<SurgeryModel> surgeries;
  final List<AdviceModel> advices;
  final bool isPrescriptionViewed;

  PrescriptionModel({
    required this.medications,
    required this.labTests,
    required this.surgeries,
    required this.advices,
    required this.isPrescriptionViewed,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> jsonData) {
    return PrescriptionModel(
      medications:
          (jsonData[ApiKey.medications] as List<dynamic>)
              .map((medication) => MedicationModel.fromJson(medication))
              .toList(),
      labTests:
          (jsonData[ApiKey.labTests] as List<dynamic>)
              .map((labTest) => LabTestModel.formJson(labTest))
              .toList(),
      surgeries:
          (jsonData[ApiKey.surgeries] as List<dynamic>)
              .map((surgery) => SurgeryModel.fromJson(surgery))
              .toList(),
      advices:
          (jsonData[ApiKey.advices] as List<dynamic>)
              .map((advice) => AdviceModel.fromJson(advice))
              .toList(),
      isPrescriptionViewed: jsonData[ApiKey.isPrescriptionViewed],
    );
  }
}
