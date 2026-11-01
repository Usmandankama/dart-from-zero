// Lesson 10 · Functions as values
//
// Run it:   dart run lesson_10_functions_as_values/functions_as_values.dart

// --- Arrow syntax: a short way to write a one-line function ------------------

int twice(int number) => number * 2;
bool isEven(int number) => number % 2 == 0;

// --- A function can take another function ------------------------------------

// int Function(int) means "a function that takes an int and gives back an int".
void applyToAll(List<int> numbers, int Function(int) action) {
  for (var number in numbers) {
    print(action(number));
  }
}

// --- typedef gives a function type a name ------------------------------------

typedef PriceRule = int Function(int price);

int applyRule(int price, PriceRule rule) => rule(price);

// --- Closures: a function remembers the variables around it ------------------

int Function() makeCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

int Function(int) makeDiscount(int percent) {
  return (price) => price - (price * percent ~/ 100);
}

void main() {
  print(twice(4)); // 8
  print(isEven(7)); // false

  // A function can sit in a variable, just like a number or some text.
  var doubler = twice;
  print(doubler(10)); // 20

  // Pass it by name, without brackets. Brackets would run it.
  applyToAll([1, 2, 3], twice);

  // --- Anonymous functions: no name needed -----------------------------------

  applyToAll([1, 2, 3], (number) {
    return number + 100;
  });
  applyToAll([1, 2, 3], (number) => number * number);

  print(applyRule(1000, (price) => price + 75)); // 1075

  // --- Closures in action ----------------------------------------------------

  var nextTicket = makeCounter();
  print(nextTicket()); // 1
  print(nextTicket()); // 2

  // A second counter has its own count.
  var otherTicket = makeCounter();
  print(otherTicket()); // 1

  var salePrice = makeDiscount(20);
  print(salePrice(5000)); // 4000
  print(salePrice(1500)); // 1200
}
