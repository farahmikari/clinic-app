import 'package:clinic_app/app/book_appointment_with_offer/models/selected_service_model.dart';
import 'package:clinic_app/core/api/end_points.dart';

class RequestOfferCashPriceModel {
  final int offerId;
  final SelectedServiceModel selectedService;

  RequestOfferCashPriceModel({
    required this.offerId,
    required this.selectedService,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.offerId: offerId,
      ApiKey.selectedService: selectedService.toJson(),
    };
  }
}
