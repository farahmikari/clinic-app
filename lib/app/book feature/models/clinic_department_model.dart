class ClinicDepartmentModel {
  final int id;
  final String name;

  ClinicDepartmentModel({required this.id, required this.name});

  factory ClinicDepartmentModel.fromJson(Map<String, dynamic> jsonData) {
    return ClinicDepartmentModel(id: jsonData['id'], name: jsonData['name']);
  }
}
