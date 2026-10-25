import 'product.dart';
import 'sale.dart';
import 'shop_exception.dart';

// The whole shop: its products and today's sales, and everything you can do
// with them. bin/shop.dart asks the questions; this class does the work.
class Shop {
  // A name starting with _ is private: only code in this file can touch it.
  // Everyone else has to go through the methods below.
  final List<Product> _products = [];
  final List<Sale> _sales = [];

  Shop();

  // A named constructor: a second way to make a Shop, this one already
  // filled with the starting stock.
  Shop.withSampleStock() {
    add(
      Product(
        name: 'Golden Penny Spaghetti',
        category: Category.food,
        price: 1200,
        stock: 24,
      ),
    );
    add(
      Product(
        name: 'Peak Milk (tin)',
        category: Category.food,
        price: 650,
        stock: 4,
        barcode: '6151100012345',
      ),
    );
    add(
      Product(
        name: 'Indomie Chicken',
        category: Category.food,
        price: 300,
        stock: 60,
      ),
    );
    add(
      Product(
        name: 'Coca-Cola (50cl)',
        category: Category.drinks,
        price: 400,
        stock: 0,
      ),
    );
    add(
      Product(
        name: 'Joy Soap',
        category: Category.toiletries,
        price: 550,
        stock: 18,
      ),
    );
    add(
      Product(
        name: 'Hypo Bleach',
        category: Category.household,
        price: 900,
        stock: 5,
      ),
    );
  }

  // List.of makes a copy, so nobody outside can add to the real list.
  List<Product> get products => List.of(_products);
  List<Sale> get sales => List.of(_sales);

  List<Product> get runningLow =>
      _products.where((product) => product.isRunningLow).toList();

  int get stockValue =>
      _products.fold(0, (total, product) => total + product.stockValue);

  // Finds a product by name, ignoring capitals. null if there isn't one.
  Product? find(String name) {
    for (Product product in _products) {
      if (product.name.toLowerCase() == name.toLowerCase()) {
        return product;
      }
    }
    return null;
  }

  // throw stops the method straight away and hands the problem back to
  // whoever called it. Nothing after the throw runs.
  void add(Product product) {
    if (product.name.trim().isEmpty) {
      throw ShopException("A product's name can't be empty.");
    }
    if (product.price <= 0) {
      throw ShopException('${product.name} needs a price above ₦0.');
    }
    if (find(product.name) != null) {
      throw ShopException('${product.name} is already in the shop.');
    }
    _products.add(product);
  }

  // Sells some of a product and gives back the sale.
  Sale sell(Product product, int quantity) {
    // ArgumentError is for mistakes in the code, not in the shop: the menu
    // should never ask to sell 0 of something.
    if (quantity <= 0) {
      throw ArgumentError.value(quantity, 'quantity', 'must be above 0');
    }
    if (product.isSoldOut) {
      throw ShopException('${product.name} is sold out.');
    }
    if (quantity > product.stock) {
      throw ShopException('Only ${product.stock} ${product.name} left.');
    }
    product.stock -= quantity;
    Sale sale = Sale(
      productName: product.name,
      quantity: quantity,
      unitPrice: product.price,
      time: DateTime.now(),
    );
    _sales.add(sale);
    return sale;
  }

  void restock(Product product, int arrived) {
    if (arrived <= 0) {
      throw ArgumentError.value(arrived, 'arrived', 'must be above 0');
    }
    product.stock += arrived;
  }

  // A record bundles several values together without making a class for
  // them. This one gives back four answers at once.
  // Sales are saved now, so the shop remembers every day's sales. The report
  // only counts one day's: today's, unless you pass a different day.
  ({int sales, int itemsSold, int takings, String? bestSeller}) todaysReport({
    DateTime? day,
  }) {
    DateTime reportDay = day ?? DateTime.now();
    List<Sale> daySales = _sales.where((sale) => sale.isOn(reportDay)).toList();

    // Add up how many of each product sold, in a map.
    Map<String, int> soldByProduct = {};
    for (Sale sale in daySales) {
      soldByProduct[sale.productName] =
          (soldByProduct[sale.productName] ?? 0) + sale.quantity;
    }

    // The best seller is the one with the biggest number. With no sales
    // there isn't one, so it stays null.
    String? bestSeller;
    int most = 0;
    for (String name in soldByProduct.keys) {
      int count = soldByProduct[name]!;
      if (count > most) {
        most = count;
        bestSeller = name;
      }
    }

    return (
      sales: daySales.length,
      itemsSold: daySales.fold(0, (total, sale) => total + sale.quantity),
      takings: daySales.fold(0, (total, sale) => total + sale.total),
      bestSeller: bestSeller,
    );
  }

  // --- Saving and loading ---------------------------------------------------

  // The whole shop as one map: a list of products and a list of sales.
  Map<String, dynamic> toJson() => {
    'products': _products.map((product) => product.toJson()).toList(),
    'sales': _sales.map((sale) => sale.toJson()).toList(),
  };

  Shop.fromJson(Map<String, dynamic> json) {
    for (var product in json['products'] as List) {
      _products.add(Product.fromJson(product as Map<String, dynamic>));
    }
    for (var sale in json['sales'] as List) {
      _sales.add(Sale.fromJson(sale as Map<String, dynamic>));
    }
  }
}
