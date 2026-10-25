// Lesson 10 · Async and files: saving the shop to disk
//
// Run it from the shop folder:   dart run
// Type a menu number and press Enter. Type q to quit.
// When it asks a question, press Enter on its own to go back to the menu.
// Everything is saved to shop.json in the folder you run it from.

import 'dart:io';

import 'package:shop/money.dart';
import 'package:shop/product.dart';
import 'package:shop/shop.dart';
import 'package:shop/shop_exception.dart';
import 'package:shop/storage.dart';

const shopName = "Mama Nkechi's Shop";

// async lets main use await. An async function always gives back a Future,
// so main's type becomes Future<void>.
Future<void> main() async {
  ShopStorage storage = ShopStorage(File('shop.json'));
  Shop shop = await storage.load();

  print('Welcome to $shopName');

  var running = true;
  while (running) {
    printMenu();
    String choice = stdin.readLineSync()?.trim() ?? 'q';

    // try runs the menu choice. If anything in it throws a ShopException,
    // Dart jumps straight to the on ... catch block instead of crashing.
    try {
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
            break;
          }
          var sale = shop.sell(product, quantity);
          await storage.save(shop);
          print(
            'Sold ${sale.quantity} x ${sale.productName} '
            'for ${formatNaira(sale.total)}.',
          );

        case '3':
          Product? product = pickProduct(shop.products);
          if (product == null) {
            break;
          }
          int? arrived = askNumber('How many arrived? ');
          if (arrived == null) {
            break;
          }
          shop.restock(product, arrived);
          await storage.save(shop);
          print(product.describe());

        case '4':
          addProduct(shop);
          await storage.save(shop);

        case '5':
          List<Product> low = shop.runningLow;
          if (low.isEmpty) {
            print('Nothing is running low.');
          } else {
            printProducts(low);
          }

        case '6':
          var (:sales, :itemsSold, :takings, :bestSeller) = shop.todaysReport();
          print('Sales today: $sales ($itemsSold items)');
          print('Taken today: ${formatNaira(takings)}');
          print('Best seller: ${bestSeller ?? 'nothing sold yet'}');
          print('Stock left is worth ${formatNaira(shop.stockValue)}.');

        case 'q' || 'Q':
          running = false;

        default:
          print('Sorry, "$choice" is not on the menu.');
      }
    } on ShopException catch (problem) {
      // A normal shop problem: tell the person and carry on.
      print('Sorry: ${problem.message}');
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
  int? number = askNumber('Which product? ', max: products.length);
  if (number == null) {
    return null;
  }
  return products[number - 1];
}

void addProduct(Shop shop) {
  String? name = askText('Product name: ');
  if (name == null) {
    return;
  }

  for (var i = 0; i < Category.values.length; i++) {
    print('${i + 1}. ${Category.values[i].name}');
  }
  int? categoryNumber = askNumber('Category: ', max: Category.values.length);
  if (categoryNumber == null) {
    return;
  }
  int? price = askNumber('Price in naira: ');
  if (price == null) {
    return;
  }
  // min: 0, because a new product can arrive with none in stock yet.
  int? stock = askNumber('How many in stock? ', min: 0);
  if (stock == null) {
    return;
  }

  Product product = Product(
    name: name,
    category: Category.values[categoryNumber - 1],
    price: price,
    stock: stock,
  );
  // If add throws (the name is already taken), the print below never runs:
  // Dart goes straight to the catch in main.
  shop.add(product);
  print('Added ${product.describe()}');
}

// Keeps asking until it gets a whole number from min to max. Pressing Enter
// on its own gives back null, which means "go back to the menu".
int? askNumber(String question, {int min = 1, int? max}) {
  while (true) {
    String? text = askText(question);
    if (text == null) {
      return null;
    }
    int? number = int.tryParse(text);
    if (number != null && number >= min && (max == null || number <= max)) {
      return number;
    }
    String range = max == null ? '$min or more' : 'from $min to $max';
    print('Please type a whole number $range, or press Enter to go back.');
  }
}

// Gives back what was typed with the spaces trimmed off, or null if nothing
// was typed (or the input has ended).
String? askText(String question) {
  stdout.write(question);
  String? text = stdin.readLineSync()?.trim();
  if (text == null || text.isEmpty) {
    return null;
  }
  return text;
}
