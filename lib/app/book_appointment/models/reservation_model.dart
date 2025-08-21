import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final int? offerId;
  final int departmentId;
  final int doctorId;
  final String day;
  final int timeId;
  final int requestTypeId;
  final bool withMedicalReport;

  const ReservationModel({
    this.offerId,
    required this.departmentId,
    required this.doctorId,
    required this.day,
    required this.timeId,
    required this.requestTypeId,
    required this.withMedicalReport,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> jsonData) {
    return ReservationModel(
      offerId: jsonData['offer_id'],
      departmentId: jsonData['department_id'],
      doctorId: jsonData['doctor_id'],
      day: jsonData['day'],
      timeId: jsonData['time_id'],
      requestTypeId: jsonData['request_type_id'],
      withMedicalReport: jsonData['with_medical_report'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (offerId != null) 'offer_id': offerId,
      'department_id': departmentId,
      'doctor_id': doctorId,
      'day': day,
      'time_id': timeId,
      'request_type_id': requestTypeId,
      'with_medical_report': withMedicalReport,
    };
  }

  ReservationModel copyWith({
    int? offerId,
    int? departmentId,
    int? doctorId,
    String? day,
    int? timeId,
    int? requestTypeId,
    bool? withMedicalReport,
  }) {
    return ReservationModel(
      offerId: offerId ?? this.offerId,
      departmentId: departmentId ?? this.departmentId,
      doctorId: doctorId ?? this.doctorId,
      day: day ?? this.day,
      timeId: timeId ?? this.timeId,
      requestTypeId: requestTypeId ?? this.requestTypeId,
      withMedicalReport: withMedicalReport ?? this.withMedicalReport,
    );
  }

  @override
  List<Object?> get props => [
    offerId,
    departmentId,
    doctorId,
    day,
    timeId,
    requestTypeId,
    withMedicalReport,
  ];
}
