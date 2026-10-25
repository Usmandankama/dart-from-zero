import 'money.dart';

const lowStockLevel = 5;

// An enum is a type with a fixed set of values. A product's category can
// only ever be one of these four, so a typo like Category.drnks won't run.
enum Category { food, drinks, toiletries, household }

// A class is a blueprint. Every Product made from it has these fields.
class Product {
  // final fields are set once, when the product is made.
  final String name;
  final Category category;
  final String? barcode;

  // These can change: prices go up, and stock goes up and down.
  int price;
  int stock;

  // The constructor. Named parameters make Product(...) easy to read, and
  // barcode can be left out because it's allowed to be null.
  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    this.barcode,
  });

  // A getter looks like a field but works its answer out each time.
  bool get isSoldOut => stock == 0;
  bool get isRunningLow => stock <= lowStockLevel;
  int get stockValue => price * stock;

  // A method: a function that belongs to the class and can use its fields.
  String describe() {
    String warning = '';
    if (isSoldOut) {
      warning = '  SOLD OUT';
    } else if (isRunningLow) {
      warning = '  low';
    }
    return '$name, ${category.name}, ${formatNaira(price)}, $stock left$warning';
  }
}
