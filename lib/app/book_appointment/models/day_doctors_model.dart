class DayDoctorsModel {
  final int morningDoctorId;
  final int afternoonDoctorId;

  factory DayDoctorsModel.fromJson(Map<String, dynamic> jsonData) {
    return DayDoctorsModel(
      morningDoctorId: jsonData["morning"],
      afternoonDoctorId: jsonData["afternoon"],
    );
  }

  DayDoctorsModel({
    required this.morningDoctorId,
    required this.afternoonDoctorId,
  });
}
