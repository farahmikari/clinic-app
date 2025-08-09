import 'package:clinic_app/core/api/end_points.dart';

class OfferModel {
  final int id;
  final String image;
  final int departmentId;
  final int doctorId;
  final String shift;
  final String paymentMethod;

  OfferModel({
    required this.id,
    required this.image,
    required this.departmentId,
    required this.doctorId,
    required this.shift,
    required this.paymentMethod,
  });

  factory OfferModel.fromJson(Map<String, dynamic> jsonData) {
    return OfferModel(
      id: jsonData[ApiKey.id],
      image: jsonData[ApiKey.image],
      departmentId: jsonData[ApiKey.departmentId],
      doctorId: jsonData[ApiKey.doctorId],
      shift: jsonData[ApiKey.shift],
      paymentMethod: jsonData[ApiKey.paymentMethod],
    );
  }
}
