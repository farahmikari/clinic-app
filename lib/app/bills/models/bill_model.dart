class BillModel {
  final int id;
  final num totalPrice;
  final String currency;
  final String status;
  final String doctorName;
  final String department;
  final String appointmentDateTime;

  BillModel({
    required this.id,
    required this.totalPrice,
    required this.currency,
    required this.status,
    required this.doctorName,
    required this.department,
    required this.appointmentDateTime,
  });

  factory BillModel.fromJson(Map<String, dynamic> jsonData) {
    return BillModel(
      id: jsonData['id'],
      totalPrice: jsonData['total_price'],
      currency: jsonData['currency'],
      status: jsonData['status'],
      doctorName: jsonData['doctor_name'],
      department: jsonData['department'],
      appointmentDateTime: jsonData['appointment_date_time'],
    );
  }
}
