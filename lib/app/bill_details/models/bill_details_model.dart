class BillDetailsModel {
  final String paymentDateTime;
  final String paymentMethod;
  final num checkUpPrice;
  final num medicalReportPrice;

  BillDetailsModel({
    required this.paymentDateTime,
    required this.paymentMethod,
    required this.checkUpPrice,
    required this.medicalReportPrice,
  });

  factory BillDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return BillDetailsModel(
      paymentDateTime: jsonData['payment_date_time'] ?? "Not Paid Yet",
      paymentMethod: jsonData['payment_method'],
      checkUpPrice: jsonData['check_up_price'],
      medicalReportPrice: jsonData['medical_report_price'],
    );
  }
}
