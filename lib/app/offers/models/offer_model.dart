class OfferModel {
  final int id;
  final String image;
  final int departmentId;
  final int doctorId;
  final String shift;
  final String paymentMethod;

  OfferModel({
    required this.id,
    required this.image,
    required this.departmentId,
    required this.doctorId,
    required this.shift,
    required this.paymentMethod,
  });

  factory OfferModel.fromJson(Map<String, dynamic> jsonData) {
    return OfferModel(
      id: jsonData["id"],
      image: jsonData["image"],
      departmentId: jsonData["department_id"],
      doctorId: jsonData["doctor_id"],
      shift: jsonData["shift"],
      paymentMethod: jsonData["payment_method"],
    );
  }
}
