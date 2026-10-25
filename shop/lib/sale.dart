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
}
