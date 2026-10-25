// Lesson 8 · Classes, enums and records
//
// Run it from the shop folder:   dart run
// Type a menu number and press Enter. Type q to quit.

import 'dart:io';

// package:shop/ means "the lib folder of this project".
import 'package:shop/money.dart';
import 'package:shop/product.dart';
import 'package:shop/shop.dart';

const shopName = "Mama Nkechi's Shop";

void main() {
  // One object holds the whole shop now, instead of maps and lists in main.
  Shop shop = Shop.withSampleStock();

  print('Welcome to $shopName');

  var running = true;
  while (running) {
    printMenu();
    String choice = stdin.readLineSync()?.trim() ?? 'q';

    switch (choice) {
      case '1':
        printProducts(shop.products);

      case '2':
        Product? product = pickProduct(shop.products);
        if (product == null) {
          break;
        }
        int? quantity = askNumber('How many? ');
        if (quantity == null) {
          print('Please type a whole number above 0.');
          break;
        }
        var sale = shop.sell(product, quantity);
        if (sale == null) {
          print('Sorry, only ${product.stock} left.');
        } else {
          print(
            'Sold ${sale.quantity} x ${sale.productName} '
            'for ${formatNaira(sale.total)}.',
          );
        }

      case '3':
        Product? product = pickProduct(shop.products);
        if (product == null) {
          break;
        }
        int? arrived = askNumber('How many arrived? ');
        if (arrived == null) {
          print('Please type a whole number above 0.');
        } else {
          shop.restock(product, arrived);
          print(product.describe());
        }

      case '4':
        addProduct(shop);

      case '5':
        List<Product> low = shop.runningLow;
        if (low.isEmpty) {
          print('Nothing is running low.');
        } else {
          printProducts(low);
        }

      case '6':
        // Pull the record's four values out into four variables at once.
        var (:sales, :itemsSold, :takings, :bestSeller) = shop.todaysReport();
        print('$sales sales, $itemsSold items, ${formatNaira(takings)} taken.');
        print('Best seller: ${bestSeller ?? 'nothing sold yet'}');
        print('Stock left is worth ${formatNaira(shop.stockValue)}.');

      case 'q' || 'Q':
        running = false;

      default:
        print('Sorry, "$choice" is not on the menu.');
    }
  }

  print('');
  print('Goodbye!');
}

// --- Asking questions ------------------------------------------------------

void printMenu() {
  print('');
  print('1. List products');
  print('2. Sell');
  print('3. Restock');
  print('4. Add a product');
  print('5. What is running low?');
  print("6. Today's sales");
  print('q. Quit');
  stdout.write('Choose: ');
}

void printProducts(List<Product> products) {
  for (var i = 0; i < products.length; i++) {
    print('${i + 1}. ${products[i].describe()}');
  }
}

Product? pickProduct(List<Product> products) {
  printProducts(products);
  int? number = askNumber('Which product? ');
  if (number == null || number > products.length) {
    print('There is no product with that number.');
    return null;
  }
  return products[number - 1];
}

void addProduct(Shop shop) {
  stdout.write('Product name: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) {
    print("The name can't be empty.");
    return;
  }

  // Category.values is a list of every value in the enum.
  for (var i = 0; i < Category.values.length; i++) {
    print('${i + 1}. ${Category.values[i].name}');
  }
  int? categoryNumber = askNumber('Category: ');
  int? price = askNumber('Price in naira: ');
  int? stock = askNumber('How many in stock? ');
  if (categoryNumber == null ||
      categoryNumber > Category.values.length ||
      price == null ||
      stock == null) {
    print('Please type whole numbers above 0, and a category from the list.');
    return;
  }

  Product product = Product(
    name: name,
    category: Category.values[categoryNumber - 1],
    price: price,
    stock: stock,
  );
  if (shop.add(product)) {
    print('Added ${product.describe()}');
  } else {
    print('$name is already in the shop.');
  }
}

int? askNumber(String question) {
  stdout.write(question);
  int? number = int.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (number == null || number <= 0) {
    return null;
  }
  return number;
}
