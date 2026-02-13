class Goldmodel {
  final String metal;
  final String currency;
  final num price;
  final int timestamp;

  Goldmodel({
    required this.metal,
    required this.currency,
    required this.price,
    required this.timestamp,
  });

  factory Goldmodel.fromJson(Map<String, dynamic> json) {
    return Goldmodel(
      metal: json['metal'] ?? '',
      currency: json['currency'] ?? '',
      price: json['price'] ?? 0,
      timestamp: json['timestamp'] ?? 0,
    );
  }
}
