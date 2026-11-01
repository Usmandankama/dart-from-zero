// Lesson 4 · Numbers and operators
//
// Run it:   dart run lesson_04_numbers/numbers.dart

void main() {
  // --- Maths -----------------------------------------------------------------

  int price = 1200;
  int quantity = 24;

  print(price + 300); // 1500
  print(price - 200); // 1000
  print(price * quantity); // 28800
  print(price / 5); // 240.0: a slash always gives a double

  // ~/ divides and drops the remainder. % gives just the remainder.
  print(quantity ~/ 10); // 2 full cartons of 10
  print(quantity % 10); // and 4 left over

  // Brackets decide what happens first, just as in school maths.
  print(2 + 3 * 4); // 14
  print((2 + 3) * 4); // 20

  // --- Changing a variable ---------------------------------------------------

  int stock = 24;
  stock = stock - 3; // 21
  stock -= 1; // The short way: 20
  stock += 5; // 25
  stock++; // Add one: 26
  stock--; // Take away one: 25
  print(stock);

  // --- Comparing gives you a bool --------------------------------------------

  print(price == 1200); // true: two equals signs ask "are these the same?"
  print(price != 1200); // false: "are these different?"
  print(price > 1000); // true
  print(price < 1000); // false
  print(price >= 1200); // true
  print(price <= 1199); // false

  // --- Logic: combining bools ------------------------------------------------

  int money = 2000;
  int hour = 22;
  bool hasMoney = money >= price; // true
  bool shopIsOpen = hour < 21; // false

  print(hasMoney && shopIsOpen); // false: && needs both to be true
  print(hasMoney || shopIsOpen); // true: || needs at least one
  print(!shopIsOpen); // true: ! flips it

  // --- Converting between types ----------------------------------------------

  int fromText = int.parse('250'); // Text to int
  double decimal = double.parse('2.75'); // Text to double
  String text = 250.toString(); // Number to text

  print(fromText + 50); // 300
  print(decimal + 1); // 3.75
  print(text.length); // 3

  print(2.75.toInt()); // 2: drops the decimal part
  print(2.75.round()); // 3: rounds to the nearest whole number
  print(5.toDouble()); // 5.0
}
