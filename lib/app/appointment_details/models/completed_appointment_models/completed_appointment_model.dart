import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/advice_model.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/lab_test_model.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/medication_model.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/surgery_model.dart';

class CompletedAppointmentModel {
  final List<MedicationModel> medications;
  final List<LabTestModel> labTests;
  final List<SurgeryModel> surgeries;
  final List<AdviceModel> advices;

  CompletedAppointmentModel({
    required this.medications,
    required this.labTests,
    required this.surgeries,
    required this.advices,
  });

  factory CompletedAppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return CompletedAppointmentModel(
      medications:
          (jsonData["medications"] as List<dynamic>)
              .map((medication) => MedicationModel.fromJson(medication))
              .toList(),
      labTests:
          (jsonData["lab_tests"] as List<dynamic>)
              .map((labTest) => LabTestModel.formJson(labTest))
              .toList(),
      surgeries:
          (jsonData["surgeries"] as List<dynamic>)
              .map((surgery) => SurgeryModel.fromJson(surgery))
              .toList(),
      advices:
          (jsonData["advices"] as List<dynamic>)
              .map((advice) => AdviceModel.fromJson(advice))
              .toList(),
    );
  }
}
