// One sale: what was sold, how many, at what price, and when.
class Sale {
  final String productName;
  final int quantity;
  final int unitPrice;
  final DateTime time;

  // The price is copied into the sale, so changing a product's price later
  // doesn't change what yesterday's sales were worth.
  Sale({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.time,
  });

  int get total => quantity * unitPrice;

  // true if the sale happened on the same calendar day as day.
  bool isOn(DateTime day) =>
      time.year == day.year && time.month == day.month && time.day == day.day;

  // Dates are saved as text like 2026-10-25T14:30:00.000.
  Map<String, dynamic> toJson() => {
    'productName': productName,
    'quantity': quantity,
    'unitPrice': unitPrice,
    'time': time.toIso8601String(),
  };

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      unitPrice: json['unitPrice'] as int,
      time: DateTime.parse(json['time'] as String),
    );
  }
}
