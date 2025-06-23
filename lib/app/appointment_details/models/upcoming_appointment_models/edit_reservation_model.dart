import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';

class EditReservationModel {
  final int appointmentId;
  final ReservationModel reservation;

  EditReservationModel({
    required this.appointmentId,
    required this.reservation,
  });

  Map<String, dynamic> toJson() {
    return {
      "appointment_id": appointmentId,
      "reservation": reservation.toJson(),
    };
  }
}
