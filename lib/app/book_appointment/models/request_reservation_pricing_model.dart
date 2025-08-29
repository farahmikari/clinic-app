import 'package:clinic_app/app/book_appointment/models/selected_service_model.dart';

class RequestReservationPricingModel {
  final int? offerId;
  final SelectedServiceModel selectedService;

  RequestReservationPricingModel({this.offerId, required this.selectedService});

  factory RequestReservationPricingModel.fromJson(
    Map<String, dynamic> jsonData,
  ) {
    return RequestReservationPricingModel(
      offerId: jsonData['offer_id'],
      selectedService: SelectedServiceModel.fromJson(jsonData),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (offerId != null) 'offer_id': offerId,
      'selected_service': selectedService.toJson(),
    };
  }
}
