import 'package:clinic_app/core/api/end_points.dart';
import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final int departmentId;
  final int doctorId;
  final int requestTypeId;
  final String day;
  final int timeId;
  final bool withMedicalReport;

  const ReservationModel({
    required this.departmentId,
    required this.doctorId,
    required this.requestTypeId,
    required this.day,
    required this.timeId,
    required this.withMedicalReport,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> jsonData) {
    return ReservationModel(
      departmentId: jsonData[ApiKey.departmentId],
      doctorId: jsonData[ApiKey.doctorId],
      requestTypeId: jsonData[ApiKey.requestTypeId],
      day: jsonData[ApiKey.day],
      timeId: jsonData[ApiKey.timeId],
      withMedicalReport: jsonData[ApiKey.withMedicalReport],
    );
  }

  ReservationModel copyWith({
    int? departmentId,
    int? doctorId,
    int? requestTypeId,
    String? day,
    int? timeId,
    bool? withMedicalReport,
  }) {
    return ReservationModel(
      departmentId: departmentId ?? this.departmentId,
      doctorId: doctorId ?? this.doctorId,
      requestTypeId: requestTypeId ?? this.requestTypeId,
      day: day ?? this.day,
      timeId: timeId ?? this.timeId,
      withMedicalReport: withMedicalReport ?? this.withMedicalReport,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.departmentId: departmentId,
      ApiKey.doctorId: doctorId,
      ApiKey.slotId: timeId,
      ApiKey.date: day,
      ApiKey.requestTypeId: requestTypeId,
      ApiKey.withMedicalReport: withMedicalReport,
    };
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
