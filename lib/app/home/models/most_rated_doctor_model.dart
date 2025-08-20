import 'package:clinic_app/core/api/end_points.dart';

class MostRatedDoctorModel {
  final int id;
  final String image;
  final String name;
  final String specialty;
  final num rate;
  final int treatments;

  MostRatedDoctorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.specialty,
    required this.rate,
    required this.treatments,
  });

  factory MostRatedDoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return MostRatedDoctorModel(
      id: jsonData[ApiKey.id],
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      specialty: jsonData[ApiKey.specialty],
      rate: jsonData[ApiKey.rate],
      treatments: jsonData[ApiKey.treatments],
    );
  }
}
