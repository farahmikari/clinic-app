import 'package:clinic_app/core/api/end_points.dart';

class DoctorModel {
  final int id;
  final int departmentId; // new please ask to add this property
  final String shift; // new please ask to add this property
  final String image;
  final String name;
  final String specialty; // the returned value is department not specialty
  final String startTime;
  final String endTime;
  final num rate;
  final int experience;
  final int treatments;
  final String bio;
  final List<String> qualifications;

  DoctorModel({
    required this.id,
    required this.departmentId,
    required this.shift,
    required this.image,
    required this.name,
    required this.specialty,
    required this.startTime,
    required this.endTime,
    required this.rate,
    required this.experience,
    required this.treatments,
    required this.bio,
    required this.qualifications,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DoctorModel(
      id: jsonData[ApiKey.id],
      departmentId: jsonData[ApiKey.departmentId],
      shift: jsonData[ApiKey.shift],
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      specialty: jsonData[ApiKey.speciality],
      startTime: jsonData[ApiKey.startTime],
      endTime: jsonData[ApiKey.endTime],
      rate: jsonData[ApiKey.rate],
      experience: jsonData[ApiKey.experience],
      treatments: jsonData[ApiKey.treatments],
      bio: jsonData[ApiKey.bio],
      qualifications: List<String>.from(jsonData[ApiKey.qualifications]),
    );
  }
}
