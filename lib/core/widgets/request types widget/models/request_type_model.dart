class RequestTypeModel {
  final int id;
  final String type;

  RequestTypeModel({required this.id, required this.type});

  factory RequestTypeModel.fromJson(Map<String, dynamic> jsonData) {
    return RequestTypeModel(id: jsonData["id"], type: jsonData["type"]);
  }
}
