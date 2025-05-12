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
      id: jsonData["id"],
      image: jsonData["image"],
      name: jsonData["name"],
      specialty: jsonData["specialty"],
      rate: jsonData["rate"],
      treatments: jsonData["treatments"],
    );
  }
}
