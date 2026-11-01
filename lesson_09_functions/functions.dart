// Lesson 9 · Functions
//
// Run it:   dart run lesson_09_functions/functions.dart

// --- A function is a named piece of code you can run again and again ---------

void sayWelcome() {
  print('Welcome to the shop!');
}

// --- Parameters: values the function needs -----------------------------------

void greet(String name) {
  print('Good morning, $name');
}

// --- return: a value the function gives back ---------------------------------

int total(int price, int quantity) {
  return price * quantity;
}

// return also ends the function straight away.
String stockLabel(int stock) {
  if (stock == 0) {
    return 'Sold out';
  }
  return '$stock left';
}

// --- Optional positional parameters go in square brackets --------------------

String fullName(String first, String last, [String? title]) {
  if (title == null) {
    return '$first $last';
  }
  return '$title $first $last';
}

// --- Named parameters go in curly braces -------------------------------------

// required means you must pass it. = gives a default if you leave it out.
int priceAfterDiscount({required int price, int percentOff = 0}) {
  return price - (price * percentOff ~/ 100);
}

// --- Scope: where a variable can be seen -------------------------------------

int visitors = 0; // Outside every function, so everything can see it.

void countVisitor() {
  visitors++;
  int insideOnly = 1; // Only exists until this function ends.
  print('Visitors: $visitors, inside only: $insideOnly');
}

void main() {
  sayWelcome();
  sayWelcome();

  greet('Fatima');
  greet('Emeka');

  print(total(1200, 3)); // 3600

  int bill = total(500, 2); // Keep the answer in a variable.
  print(bill + 100); // 1100

  print(stockLabel(0)); // Sold out
  print(stockLabel(7)); // 7 left

  print(fullName('Funke', 'Ade')); // Funke Ade
  print(fullName('Funke', 'Ade', 'Dr')); // Dr Funke Ade

  // Named parameters read clearly, and can go in any order.
  print(priceAfterDiscount(price: 10000)); // 10000
  print(priceAfterDiscount(price: 10000, percentOff: 15)); // 8500
  print(priceAfterDiscount(percentOff: 50, price: 2000)); // 1000

  countVisitor();
  countVisitor();
  // print(insideOnly); // Uncomment to see the error: it doesn't exist here.
}
