class AdviceModel {
  final int id;
  final String advice;

  AdviceModel({required this.id, required this.advice});

  factory AdviceModel.fromJson(Map<String, dynamic> jsonData) {
    return AdviceModel(id: jsonData["id"], advice: jsonData["advice"]);
  }
}
