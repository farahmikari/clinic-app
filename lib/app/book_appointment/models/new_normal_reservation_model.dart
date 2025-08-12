import 'package:equatable/equatable.dart';

class NewNormalReservationModel extends Equatable {
  final int departmentId;
  final int doctorId;
  final int requestTypeId;
  final String day;
  final int timeId;
  final bool withMedicalReport;

  const NewNormalReservationModel({
    required this.departmentId,
    required this.doctorId,
    required this.requestTypeId,
    required this.day,
    required this.timeId,
    required this.withMedicalReport,
  });

  factory NewNormalReservationModel.fromJson(Map<String, dynamic> jsonData) {
    return NewNormalReservationModel(
      departmentId: jsonData["department_id"],
      doctorId: jsonData["doctor_id"],
      requestTypeId: jsonData["request_type_id"],
      day: jsonData["day"],
      timeId: jsonData["time_id"],
      withMedicalReport: jsonData["with_medical_report"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "department_id": departmentId,
      "doctor_id": doctorId,
      "request_type_id": requestTypeId,
      "day": day,
      "time_id": timeId,
      "with_medical_report": withMedicalReport,
    };
  }

  NewNormalReservationModel copyWith({
    int? departmentId,
    int? doctorId,
    int? requestTypeId,
    String? day,
    int? timeId,
    bool? withMedicalReport,
  }) {
    return NewNormalReservationModel(
      departmentId: departmentId ?? this.departmentId,
      doctorId: doctorId ?? this.doctorId,
      requestTypeId: requestTypeId ?? this.requestTypeId,
      day: day ?? this.day,
      timeId: timeId ?? this.timeId,
      withMedicalReport: withMedicalReport ?? this.withMedicalReport,
    );
  }

  @override
  List<Object?> get props => [
    departmentId,
    doctorId,
    requestTypeId,
    day,
    timeId,
    withMedicalReport,
  ];
}
