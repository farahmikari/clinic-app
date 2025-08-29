import 'package:clinic_app/core/api/end_points.dart';
import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final int? offerId;
  final int departmentId;
  final int doctorId;
  final String date;
  final int slotId;
  final int requestTypeId;
  final bool withMedicalReport;

  const ReservationModel({
    this.offerId,
    required this.departmentId,
    required this.doctorId,
    required this.date,
    required this.slotId,
    required this.requestTypeId,
    required this.withMedicalReport,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> jsonData) {
    return ReservationModel(
      offerId: jsonData[ApiKey.offerId],
      departmentId: jsonData[ApiKey.departmentId],
      doctorId: jsonData[ApiKey.doctorId],
      date: jsonData[ApiKey.date],
      slotId: jsonData[ApiKey.slotId],
      requestTypeId: jsonData[ApiKey.requestTypeId],
      withMedicalReport: jsonData[ApiKey.withMedicalReport],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (offerId != null) ApiKey.offerId: offerId,
      ApiKey.departmentId: departmentId,
      ApiKey.doctorId: doctorId,
      ApiKey.date: date,
      ApiKey.slotId: slotId,
      ApiKey.requestTypeId: requestTypeId,
      ApiKey.withMedicalReport: withMedicalReport,
    };
  }

  ReservationModel copyWith({
    int? offerId,
    int? departmentId,
    int? doctorId,
    String? date,
    int? slotId,
    int? requestTypeId,
    bool? withMedicalReport,
  }) {
    return ReservationModel(
      offerId: offerId ?? this.offerId,
      departmentId: departmentId ?? this.departmentId,
      doctorId: doctorId ?? this.doctorId,
      date: date ?? this.date,
      slotId: slotId ?? this.slotId,
      requestTypeId: requestTypeId ?? this.requestTypeId,
      withMedicalReport: withMedicalReport ?? this.withMedicalReport,
    );
  }

  @override
  List<Object?> get props => [
    offerId,
    departmentId,
    doctorId,
    date,
    slotId,
    requestTypeId,
    withMedicalReport,
  ];
}
