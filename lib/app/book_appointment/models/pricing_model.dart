class PricingModel {
  final num price;
  final String currency;

  PricingModel({required this.price, required this.currency});

  factory PricingModel.fromJson(Map<String, dynamic> jsonData) {
    return PricingModel(
      price: jsonData['price'],
      currency: jsonData['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"price": price, "currency": currency};
  }
}
