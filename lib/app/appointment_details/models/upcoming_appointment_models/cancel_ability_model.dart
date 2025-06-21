class CancelAbilityModel {
  final bool isCancelable;

  CancelAbilityModel({required this.isCancelable});

  factory CancelAbilityModel.fromJson(Map<String, dynamic> jsonData) {
    return CancelAbilityModel(isCancelable: jsonData["is_cancelable"]);
  }
}
