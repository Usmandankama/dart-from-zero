// Lesson 13 · Working through collections: where, map and fold
//
// Run it:   dart run lesson_13_collections/working_through.dart

void main() {
  var prices = [1200, 350, 800, 4000, 150];
  var names = ['Ada', 'Bola', 'Chinedu', 'Dayo'];

  // --- where: keep the items that pass a test --------------------------------

  var cheap = prices.where((price) => price < 1000);
  print(cheap); // (350, 800, 150)
  print(cheap.toList()); // [350, 800, 150]

  // --- map: turn each item into something else -------------------------------

  print(prices.map((price) => price * 2).toList());
  print(names.map((name) => name.toUpperCase()).toList());
  print(prices.map((price) => '₦$price').join(', '));

  // --- Chaining: one step after another --------------------------------------

  var labels = prices
      .where((price) => price >= 1000)
      .map((price) => 'Big: ₦$price')
      .toList();
  print(labels); // [Big: ₦1200, Big: ₦4000]

  // --- fold: boil a list down to one value -----------------------------------

  // Start at 0. Each round, the answer so far meets the next item.
  int total = prices.fold(0, (sum, price) => sum + price);
  print(total); // 6500

  int longest = names.fold(0, (most, name) {
    return name.length > most ? name.length : most;
  });
  print(longest); // 7

  // --- Asking questions ------------------------------------------------------

  print(prices.any((price) => price > 3000)); // true: at least one
  print(prices.every((price) => price > 200)); // false: not all of them
  print(names.firstWhere((name) => name.startsWith('C'))); // Chinedu

  // --- Sorting your own way --------------------------------------------------

  // A negative answer puts a first. A positive answer puts b first.
  names.sort((a, b) => b.length - a.length); // Longest first
  print(names);
}
