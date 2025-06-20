class DepartmentDoctorModel {
  final int id;

  DepartmentDoctorModel({required this.id});
  factory DepartmentDoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DepartmentDoctorModel(id: jsonData["id"]);
  }
}
