// Lesson 12 · Solutions
//
// Run it:   dart run lesson_12_maps_and_sets/solutions.dart

void main() {
  // 1.
  var capitals = {'Kano': 'Kano', 'Rivers': 'Port Harcourt', 'Oyo': 'Ibadan'};
  print(capitals['Rivers']);
  print(capitals['Mars'] ?? 'Unknown');

  // 2.
  capitals['Enugu'] = 'Enugu';
  capitals['Oyo'] = 'Ibadan City';
  capitals.remove('Rivers');
  for (var entry in capitals.entries) {
    print('The capital of ${entry.key} is ${entry.value}.');
  }

  // 3.
  Map<String, int> counts = {};
  for (var word in ['yes', 'no', 'yes', 'maybe', 'yes', 'no']) {
    counts[word] = (counts[word] ?? 0) + 1;
  }
  print(counts); // {yes: 3, no: 2, maybe: 1}

  // 4.
  var numbers = [1, 2, 2, 3, 3, 3, 4];
  print(numbers.toSet().length); // 4

  // 5.
  var mine = {'Jollof', 'Suya', 'Egusi'};
  var yours = {'Suya', 'Amala', 'Egusi'};
  print(mine.intersection(yours)); // {Suya, Egusi}
}
