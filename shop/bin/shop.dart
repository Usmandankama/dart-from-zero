// Lesson 6 · Functions
//
// Run it from the shop folder:   dart run
// Type a menu number and press Enter. Type q to quit.

import 'dart:io';

// Values every function in the file can use live up here, outside main.
const shopName = "Mama Nkechi's Shop";
const naira = '₦';
const lowStockLevel = 5;

void main() {
  String name = 'Golden Penny Spaghetti';
  int price = 1200;
  int stock = 24;

  int packsSold = 0;
  int takings = 0;

  print('Welcome to $shopName');

  var running = true;
  while (running) {
    printMenu();
    String choice = stdin.readLineSync()?.trim() ?? 'q';

    switch (choice) {
      case '1':
        showProduct(name, price: price, stock: stock);

      case '2':
        int? quantity = askNumber('How many? ');
        if (quantity == null) {
          print('Please type a whole number above 0.');
        } else if (quantity > stock) {
          print('Sorry, only $stock left.');
        } else {
          stock -= quantity;
          packsSold += quantity;
          takings += quantity * price;
          print('Sold $quantity for ${formatNaira(quantity * price)}.');
          showProduct(name, price: price, stock: stock);
        }

      case '3':
        int? arrived = askNumber('How many arrived? ');
        if (arrived == null) {
          print('Please type a whole number above 0.');
        } else {
          stock += arrived;
          showProduct(name, price: price, stock: stock);
        }

      case '4':
        printPriceList(name, price);

      case 'q' || 'Q':
        running = false;

      default:
        print('Sorry, "$choice" is not on the menu.');
    }
  }

  print('');
  print('Today: $packsSold packs sold for ${formatNaira(takings)}. Goodbye!');
}

// --- Functions -------------------------------------------------------------

// void means the function does its job and gives nothing back.
void printMenu() {
  print('');
  print('1. Show the product');
  print('2. Sell');
  print('3. Restock');
  print('4. Price list');
  print('q. Quit');
  stdout.write('Choose: ');
}

// Asks a question and gives back the whole number typed, or null if what was
// typed isn't a number above 0.
int? askNumber(String question) {
  stdout.write(question);
  int? number = int.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (number == null || number <= 0) {
    return null;
  }
  return number;
}

// Turns 28800 into ₦28,800. It walks along the digits and puts a comma
// before every group of three, counting from the right.
String formatNaira(int amount) {
  String digits = amount.abs().toString();
  String result = '';
  for (var i = 0; i < digits.length; i++) {
    int digitsLeft = digits.length - i;
    if (i > 0 && digitsLeft % 3 == 0) {
      result += ',';
    }
    result += digits[i];
  }
  return amount < 0 ? '-$naira$result' : '$naira$result';
}

// A function that's a single expression can use => instead of { return ...; }.
bool isRunningLow(int stock) => stock <= lowStockLevel;

// Named parameters go inside { }. Callers write the name, so
// showProduct(name, price: 1200, stock: 24) is easy to read.
// required means you can't leave them out.
void showProduct(String name, {required int price, required int stock}) {
  print('$name: ${formatNaira(price)} each, $stock in stock');
  if (stock == 0) {
    print('Sold out!');
  } else if (isRunningLow(stock)) {
    print('Running low. Order more soon.');
  }
}

// upTo has a default value, so you can leave it out and get 5 rows.
void printPriceList(String name, int price, {int upTo = 5}) {
  for (var packs = 1; packs <= upTo; packs++) {
    print('$packs x $name = ${formatNaira(packs * price)}');
  }
}
