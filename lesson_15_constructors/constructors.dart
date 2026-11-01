// Lesson 15 · Constructors
//
// Run it:   dart run lesson_15_constructors/constructors.dart

// --- Named parameters and defaults -------------------------------------------

class Product {
  final String name; // final: set once, when the object is built.
  final int price;
  int stock;
  String? barcode; // Nullable, so it's fine to leave it out.

  Product({
    required this.name,
    required this.price,
    this.stock = 0,
    this.barcode,
  });

  // --- Named constructors: more than one way to build an object --------------

  Product.free(this.name) : price = 0, stock = 1;

  // --- Redirecting: one constructor hands over to another --------------------

  Product.outOfStock(String name, int price)
    : this(name: name, price: price, stock: 0);

  @override
  String toString() => '$name: ₦$price, $stock in stock';
}

// --- Initializer lists: work out fields before the body runs -----------------

class Rectangle {
  final double width;
  final double height;
  final double area; // Worked out from the other two.

  Rectangle(this.width, this.height)
    : assert(width > 0), // Checks a rule while you're developing.
      area = width * height;
}

// --- const constructors: objects that never change ---------------------------

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates(this.latitude, this.longitude);
}

// --- factory constructors: full control over what comes back -----------------

class Currency {
  final String code;

  // A leading underscore keeps this constructor private. Lesson 16 explains.
  Currency._(this.code);

  static final Map<String, Currency> _known = {};

  // A factory can return an object that already exists.
  factory Currency(String code) {
    return _known.putIfAbsent(code, () => Currency._(code));
  }

  // A factory can also check or clean up the values first.
  factory Currency.fromText(String text) => Currency(text.trim().toUpperCase());
}

// --- late: "I promise to set this before it's used" --------------------------

class Receipt {
  late String number;

  void assignNumber(int sale) {
    number = 'RCPT-$sale';
  }
}

void main() {
  print(Product(name: 'Rice', price: 75000, stock: 10));
  print(Product(name: 'Beans', price: 60000)); // stock defaults to 0
  print(Product.free('Sample sachet'));
  print(Product.outOfStock('Garri', 25000));

  var room = Rectangle(4, 3);
  print(room.area); // 12.0

  const lagos = Coordinates(6.52, 3.37);
  const alsoLagos = Coordinates(6.52, 3.37);
  print(identical(lagos, alsoLagos)); // true: Dart keeps just one object

  var naira = Currency('NGN');
  var sameNaira = Currency.fromText(' ngn ');
  print(identical(naira, sameNaira)); // true: the factory reused it

  var receipt = Receipt();
  receipt.assignNumber(42);
  print(receipt.number); // RCPT-42
}
