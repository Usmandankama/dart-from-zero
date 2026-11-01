// Lesson 22 · Records and patterns: records
//
// Run it:   dart run lesson_22_records_and_patterns/records.dart

// --- A record groups a few values together, with no class needed -------------

// A function can only return one thing. A record lets that thing hold several.
(int, int) dailyTotals(List<int> sales) {
  int total = sales.fold(0, (sum, sale) => sum + sale);
  return (total, sales.length);
}

// Named fields make the meaning clear.
({int total, int count}) weeklyTotals(List<int> sales) {
  return (total: sales.fold(0, (sum, sale) => sum + sale), count: sales.length);
}

void main() {
  // --- Positional fields: $1, $2 ---------------------------------------------

  var product = ('Rice', 75000);
  print(product); // (Rice, 75000)
  print(product.$1); // Rice
  print(product.$2); // 75000

  // --- Named fields ----------------------------------------------------------

  var person = (name: 'Tobi', age: 27);
  print(person.name); // Tobi
  print(person.age); // 27

  // --- Records compare by what's inside them ---------------------------------

  print((1, 'a') == (1, 'a')); // true

  // --- Records from functions ------------------------------------------------

  var today = dailyTotals([1200, 800, 500]);
  print(today.$1); // 2500

  var week = weeklyTotals([9000, 7500]);
  print('${week.count} days made ₦${week.total}');

  // --- Destructuring: unpack a record into variables -------------------------

  var (sum, count) = dailyTotals([1200, 800, 500]);
  print('$count sales made ₦$sum');

  // :total is short for total: total.
  var (:total, count: days) = weeklyTotals([9000, 7500]);
  print('$days days made ₦$total');

  // A handy trick: swap two values.
  var first = 'A';
  var second = 'B';
  (first, second) = (second, first);
  print('$first $second'); // B A
}
