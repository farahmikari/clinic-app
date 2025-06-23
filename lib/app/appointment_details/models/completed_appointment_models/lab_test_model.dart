class LabTestModel {
  final int id;
  final String name;

  LabTestModel({required this.id, required this.name});

  factory LabTestModel.formJson(Map<String, dynamic> jsonData) {
    return LabTestModel(id: jsonData["id"], name: jsonData["name"]);
  }
}
