import 'package:clinic_app/core/api/end_points.dart';

class RequestOfferPointsPriceModel {
  final int offerId;

  RequestOfferPointsPriceModel({required this.offerId});

  Map<String, dynamic> toJson() {
    return {ApiKey.offerId: offerId};
  }
}
