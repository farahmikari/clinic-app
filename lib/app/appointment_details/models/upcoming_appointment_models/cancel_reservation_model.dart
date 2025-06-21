class CancelReservationModel {
  final int appointmentId;

  CancelReservationModel({required this.appointmentId});

  Map<String, dynamic> toJson() {
    return {"appointment_id": appointmentId};
  }
}
