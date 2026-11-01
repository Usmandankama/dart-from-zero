// Lesson 3 · Variables and types
//
// Run it:   dart run lesson_03_variables/variables.dart

void main() {
  // --- The four basic types --------------------------------------------------

  // A variable is a named box. Its type says what can go in the box.
  String name = 'Golden Penny Spaghetti'; // Text
  int price = 1200; // Whole numbers
  double weightKg = 0.5; // Numbers with a decimal point
  bool inStock = true; // true or false

  print(name);
  print(price);
  print(weightKg);
  print(inStock);

  // --- Changing a value ------------------------------------------------------

  price = 1500; // The box keeps its name and type, but holds a new value.
  print(price);

  // price = 'cheap'; // Uncomment to see the error: price is an int.

  // --- var: let Dart work out the type ---------------------------------------

  var city = 'Lagos'; // Dart sees text, so city is a String.
  var students = 30; // Dart sees a whole number, so students is an int.
  students = 31;
  print('$city has $students students.');

  // --- final and const: values that never change -----------------------------

  // final: set once, while the program runs.
  final openedAt = DateTime.now();
  print(openedAt);

  // const: known before the program even runs.
  const vatPercent = 7.5;
  print(vatPercent);

  // openedAt = DateTime.now(); // Uncomment to see the error.
  // vatPercent = 10; // Uncomment to see the error.
}
