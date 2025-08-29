class VitalSignalsModel {
  String? heartRate;
  String? bloodGroup;
  String? temprature;
  String? weight;
  String? height;
  String? pressure;
  String? bloodSugar;

  VitalSignalsModel({
    required this.heartRate,
    required this.bloodGroup,
    required this.temprature,
    required this.weight,
    required this.height,
    required this.pressure,
    required this.bloodSugar,
  });

  factory VitalSignalsModel.formJson(Map<String, dynamic> json) =>
      VitalSignalsModel(
        heartRate: json["heart_rate"],
        bloodGroup: json["blood_group"],
        temprature: json["temprature"],
        weight: json["weight"],
        height: json["height"],
        pressure: json["pressure"],
        bloodSugar: json["bloodSugar"],
      );
  Map<String, dynamic> toJson() => {
    "heart_rate": heartRate,
    "blood_group": bloodGroup,
    "temperature": temprature,
    "weight": weight,
    "height": height,
    "pressure": pressure,
    "blood_sugar": bloodSugar,
  };
}
