// Lesson 7 · Lists, maps and sets
//
// Run it from the shop folder:   dart run
// Type a menu number and press Enter. Type q to quit.

import 'dart:io';

const shopName = "Mama Nkechi's Shop";
const naira = '₦';
const lowStockLevel = 5;

void main() {
  // --- The shop's data -----------------------------------------------------

  // A map looks things up by a key. Here the key is the product's name and
  // the value is its price in naira.
  Map<String, int> prices = {
    'Golden Penny Spaghetti': 1200,
    'Peak Milk (tin)': 650,
    'Indomie Chicken': 300,
    'Bama Mayonnaise': 2100,
    'Coca-Cola (50cl)': 400,
  };

  // A second map, with the same keys, holds how many of each are in stock.
  Map<String, int> stock = {
    'Golden Penny Spaghetti': 24,
    'Peak Milk (tin)': 4,
    'Indomie Chicken': 60,
    'Bama Mayonnaise': 6,
    'Coca-Cola (50cl)': 0,
  };

  // A list keeps values in order, and can hold the same value twice.
  // Every sale's total goes on the end of this one.
  List<int> saleTotals = [];

  // A set never holds the same value twice, so adding a name that's already
  // there does nothing. It tells us how many different products sold today.
  Set<String> soldToday = {};

  print('Welcome to $shopName');

  var running = true;
  while (running) {
    printMenu();
    String choice = stdin.readLineSync()?.trim() ?? 'q';

    switch (choice) {
      case '1':
        printProducts(prices, stock);

      case '2':
        String? name = pickProduct(prices);
        if (name == null) {
          break; // break leaves the switch early.
        }
        int? quantity = askNumber('How many? ');
        // Looking up a key that isn't in a map gives null, so ?? 0 is a
        // safe default. pickProduct only gives back names that are there.
        int inStock = stock[name] ?? 0;
        int price = prices[name] ?? 0;
        if (quantity == null) {
          print('Please type a whole number above 0.');
        } else if (quantity > inStock) {
          print('Sorry, only $inStock left.');
        } else {
          stock[name] = inStock - quantity;
          saleTotals.add(quantity * price);
          soldToday.add(name);
          print('Sold $quantity x $name for ${formatNaira(quantity * price)}.');
        }

      case '3':
        String? name = pickProduct(prices);
        if (name == null) {
          break;
        }
        int? arrived = askNumber('How many arrived? ');
        if (arrived == null) {
          print('Please type a whole number above 0.');
        } else {
          stock[name] = (stock[name] ?? 0) + arrived;
          print('$name: ${stock[name]} in stock now.');
        }

      case '4':
        stdout.write('Product name: ');
        String name = stdin.readLineSync()?.trim() ?? '';
        if (name.isEmpty) {
          print('The name can\'t be empty.');
        } else if (prices.containsKey(name)) {
          print('$name is already in the shop.');
        } else {
          int? price = askNumber('Price in naira: ');
          int? count = askNumber('How many in stock? ');
          if (price == null || count == null) {
            print('Please type whole numbers above 0.');
          } else {
            prices[name] = price;
            stock[name] = count;
            print('Added $name.');
          }
        }

      case '5':
        // where keeps only the items the test says yes to.
        // (name) => ... is a function with no name, written right here.
        List<String> low = prices.keys
            .where((name) => isRunningLow(stock[name] ?? 0))
            .toList();
        if (low.isEmpty) {
          print('Nothing is running low.');
        } else {
          print('Running low: ${low.join(', ')}');
        }

      case '6':
        // fold walks the list and keeps a running total, starting from 0.
        int takings = saleTotals.fold(0, (total, sale) => total + sale);
        print('${saleTotals.length} sales, ${formatNaira(takings)} taken.');
        print('Different products sold: ${soldToday.length}');

        // map turns each product into something else: here, its stock value.
        // The ! promises Dart the price isn't null. That's safe here because
        // every name comes from prices.keys, but use it sparingly: if you're
        // wrong, the program crashes.
        int stockValue = prices.keys
            .map((name) => prices[name]! * (stock[name] ?? 0))
            .fold(0, (total, value) => total + value);
        print('Stock left is worth ${formatNaira(stockValue)}.');

      case 'q' || 'Q':
        running = false;

      default:
        print('Sorry, "$choice" is not on the menu.');
    }
  }

  print('');
  print('Goodbye!');
}

// --- Functions -------------------------------------------------------------

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

// Prints every product with a number in front, in the order they were added.
void printProducts(Map<String, int> prices, Map<String, int> stock) {
  // for-in visits each item in turn. keys is every key in the map.
  int number = 1;
  for (String name in prices.keys) {
    int inStock = stock[name] ?? 0;
    String warning = '';
    if (inStock == 0) {
      warning = '  SOLD OUT';
    } else if (isRunningLow(inStock)) {
      warning = '  low';
    }
    print('$number. $name, ${formatNaira(prices[name]!)}, $inStock$warning');
    number++;
  }
}

// Lists the products and gives back the one picked, or null.
String? pickProduct(Map<String, int> prices) {
  List<String> names = prices.keys.toList();
  for (var i = 0; i < names.length; i++) {
    print('${i + 1}. ${names[i]}');
  }
  int? number = askNumber('Which product? ');
  // A list counts from 0, so product 1 is names[0].
  if (number == null || number > names.length) {
    print('There is no product with that number.');
    return null;
  }
  return names[number - 1];
}

int? askNumber(String question) {
  stdout.write(question);
  int? number = int.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (number == null || number <= 0) {
    return null;
  }
  return number;
}

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

bool isRunningLow(int stock) => stock <= lowStockLevel;
