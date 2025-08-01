class DepartmentDoctorModel {
  final int id;
  final String name;
  final String image;
  final String shift;
  final int treatments;
  final int experience;
  final num rate;

  DepartmentDoctorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.shift,
    required this.treatments,
    required this.experience,
    required this.rate,
  });

  factory DepartmentDoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DepartmentDoctorModel(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      shift: jsonData['shift'],
      treatments: jsonData['treatments'],
      experience: jsonData['experience'],
      rate: jsonData['rate'],
    );
  }
}
