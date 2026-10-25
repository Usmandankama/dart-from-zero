// Lesson 4 · Null safety: values that might be missing
//
// Run it from the shop folder:   dart run

void main() {
  // --- Values that never change --------------------------------------------

  // const: known before the program runs. final: set once, while it runs.
  const shopName = "Mama Nkechi's Shop";
  const naira = '₦';
  final openedAt = DateTime.now();

  // --- One product ---------------------------------------------------------

  // A variable is a named box. Its type says what can go in the box.
  String name = 'Golden Penny Spaghetti';
  int price = 1200; // Naira, as a whole number: we don't use kobo.
  int stock = 24;
  double weightKg = 0.5;
  bool inStock = stock > 0;

  // With var, Dart works out the type from the value. This one is an int.
  var lowStockLevel = 5;

  // stock = 'twenty'; // Uncomment to see the error: stock is an int.

  // --- Maths ---------------------------------------------------------------

  int stockValue = price * stock; // 28800
  double pricePerKg = price / weightKg; // / always gives a double: 2400.0

  // ~/ divides and drops the remainder. % gives just the remainder.
  int cartons = stock ~/ 10; // 2 full cartons of 10
  int loose = stock % 10; // and 4 loose packs

  // A customer buys 3, so the stock goes down.
  stock = stock - 3;
  stock -= 1; // The short way to write stock = stock - 1. Now 20.

  // --- Putting values in text ----------------------------------------------

  // $name drops a value into the text. ${...} works for anything longer.
  print('Welcome to $shopName');
  print(
    'Opened at ${openedAt.hour}:${openedAt.minute.toString().padLeft(2, '0')}',
  );
  print('');
  print(name.toUpperCase()); // GOLDEN PENNY SPAGHETTI
  print('Price: $naira$price'); // Price: ₦1200
  print('Per kg: $naira${pricePerKg.toStringAsFixed(2)}'); // Per kg: ₦2400.00
  print('In stock: $inStock, $stock left'); // In stock: true, 20 left
  print('Before the sale: $cartons cartons and $loose loose'); // 2 and 4
  print('Stock was worth $naira$stockValue'); // Stock was worth ₦28800

  // condition ? this : that picks one of two values.
  print('Running low? ${stock <= lowStockLevel ? 'yes' : 'no'}'); // no

  // --- Values that might be missing ----------------------------------------

  // A normal variable can never be null (no value). Try it:
  // int discount = null; // Uncomment to see the error.

  // A ? on the type means "this, or nothing". Not every product has a
  // barcode, so barcodeFor (at the bottom of this file) can give back null.
  String? barcode = barcodeFor(name);
  String? milkBarcode = barcodeFor('Peak Milk');

  // Way 1: ?? means "use this other value if it's null".
  print('');
  print('Barcode: ${barcode ?? 'none yet'}'); // Barcode: none yet

  // Way 2: ?. means "only do this if it isn't null". Otherwise you get null.
  print('Barcode digits: ${barcode?.length}'); // Barcode digits: null

  // Way 3: check first. Inside the if, Dart knows milkBarcode isn't null.
  if (milkBarcode != null) {
    print('Peak Milk: $milkBarcode, ${milkBarcode.length} digits'); // 13
  }

  // ??= sets a value only if there isn't one yet.
  barcode ??= 'NO-CODE';
  print('Barcode now: $barcode'); // Barcode now: NO-CODE

  // --- Turning text into numbers -------------------------------------------

  // Whatever someone types arrives as text. int.tryParse turns it into an
  // int, or gives null if the text isn't a whole number.
  int? sold = int.tryParse('3');
  int? typo = int.tryParse('three');
  print('Sold: $sold, typo: $typo'); // Sold: 3, typo: null

  // Dart won't let you do maths with an int? until you've dealt with null.
  // int wrong = stock - typo; // Uncomment to see the error.
  int left = stock - (typo ?? 0);
  print('Left after the typo: $left'); // Left after the typo: 20

  // Three quotes let text run over several lines.
  print('''

Thank you for shopping at
$shopName''');
}

// Gives back a product's barcode, or null if it doesn't have one yet.
// Lesson 6 explains functions like this one properly.
String? barcodeFor(String product) {
  if (product == 'Peak Milk') {
    return '6151100012345';
  }
  return null;
}
