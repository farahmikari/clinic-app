class DoctorModel {
  final int id;
  final String image;
  final String name;
  final String specialty;
  final String startHour;
  final String endHour;
  final num rate;
  final int experience;
  final int treatments;
  final String bio;
  final List<String> qualifications;

  DoctorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.specialty,
    required this.startHour,
    required this.endHour,
    required this.rate,
    required this.experience,
    required this.treatments,
    required this.bio,
    required this.qualifications,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DoctorModel(
      id: jsonData["id"],
      image: jsonData["image"],
      name: jsonData["name"],
      specialty: jsonData["specialty"],
      startHour: jsonData["start_hour"],
      endHour: jsonData["end_hour"],
      rate: jsonData["rate"],
      experience: jsonData["experience"],
      treatments: jsonData["treatments"],
      bio: jsonData["bio"],
      qualifications: jsonData["qualifications"],
    );
  }
}
