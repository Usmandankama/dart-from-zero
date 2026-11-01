// Lesson 12 · Maps
//
// Run it:   dart run lesson_12_maps_and_sets/maps.dart

void main() {
  // --- Making a map ----------------------------------------------------------

  // A map links keys to values, like words and meanings in a dictionary.
  // Map<String, int> means String keys and int values.
  Map<String, int> prices = {'Rice': 75000, 'Beans': 60000, 'Garri': 25000};

  print(prices);
  print(prices.length); // 3

  // --- Looking things up -----------------------------------------------------

  print(prices['Rice']); // 75000
  print(prices['Yam']); // null: there's no such key

  // A lookup gives an int?, because the key might not be there.
  int garri = prices['Garri'] ?? 0;
  print(garri + 1000); // 26000

  print(prices.containsKey('Beans')); // true
  print(prices.containsValue(1)); // false

  // --- Adding, changing, removing --------------------------------------------

  prices['Yam'] = 4000; // A new key adds an entry.
  prices['Rice'] = 80000; // An existing key changes its value.
  prices.remove('Garri');
  print(prices);

  // update changes a value using its old value.
  prices.update('Beans', (old) => old + 5000);
  print(prices['Beans']); // 65000

  // --- Looping ---------------------------------------------------------------

  print(prices.keys); // (Rice, Beans, Yam)
  print(prices.values); // (80000, 65000, 4000)

  for (var entry in prices.entries) {
    print('${entry.key} costs ₦${entry.value}');
  }

  // --- A classic use: counting -----------------------------------------------

  var sales = ['Rice', 'Yam', 'Rice', 'Beans', 'Rice'];
  Map<String, int> counts = {};

  for (var item in sales) {
    counts[item] = (counts[item] ?? 0) + 1;
  }
  print(counts); // {Rice: 3, Yam: 1, Beans: 1}
}
