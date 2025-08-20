import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/core/api/end_points.dart';

class OfferReservationModel {
  final int offerId;
  final ReservationModel reservation;

  OfferReservationModel({required this.offerId, required this.reservation});

  Map<String, dynamic> toJson() {
    return {ApiKey.offerId: offerId, ApiKey.reservation: reservation.toJson()};
  }
}
