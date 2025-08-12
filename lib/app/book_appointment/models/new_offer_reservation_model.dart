import 'package:equatable/equatable.dart';

class NewOfferReservationModel extends Equatable {
  final int offerId;
  final int departmentId;
  final int doctorId;
  final int requestTypeId;
  final String day;
  final int timeId;
  final bool withMedicalReport;

  const NewOfferReservationModel({
    required this.offerId,
    required this.departmentId,
    required this.doctorId,
    required this.requestTypeId,
    required this.day,
    required this.timeId,
    required this.withMedicalReport,
  });

  factory NewOfferReservationModel.fromJson(Map<String, dynamic> jsonData) {
    return NewOfferReservationModel(
      offerId: jsonData["offer_id"],
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
      "offer_id": offerId,
      "department_id": departmentId,
      "doctor_id": doctorId,
      "request_type_id": requestTypeId,
      "day": day,
      "time_id": timeId,
      "with_medical_report": withMedicalReport,
    };
  }

  NewOfferReservationModel copyWith({
    int? offerId,
    int? departmentId,
    int? doctorId,
    int? requestTypeId,
    String? day,
    int? timeId,
    bool? withMedicalReport,
  }) {
    return NewOfferReservationModel(
      offerId: offerId ?? this.offerId,
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
    offerId,
    departmentId,
    doctorId,
    requestTypeId,
    day,
    timeId,
    withMedicalReport,
  ];
}
