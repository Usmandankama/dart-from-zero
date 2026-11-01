// Lesson 12 · Sets
//
// Run it:   dart run lesson_12_maps_and_sets/sets.dart

void main() {
  // --- A set holds each value only once --------------------------------------

  Set<String> visited = {'Lagos', 'Kano'};

  print(visited.add('Jos')); // true: it was added
  print(visited.add('Lagos')); // false: it's already there
  print(visited); // {Lagos, Kano, Jos}

  print(visited.contains('Kano')); // true
  print(visited.length); // 3

  visited.remove('Kano');
  print(visited); // {Lagos, Jos}

  // An empty set needs its type, because {} on its own makes a map.
  Set<int> seen = {};
  print(seen.isEmpty); // true

  // --- Removing duplicates from a list ---------------------------------------

  var phoneNumbers = ['0801', '0802', '0801', '0803', '0802'];
  print(phoneNumbers.toSet()); // {0801, 0802, 0803}
  print(phoneNumbers.toSet().toList()); // Back to a list.

  // --- Comparing two sets ----------------------------------------------------

  var morningClass = {'Ada', 'Bola', 'Chidi'};
  var eveningClass = {'Bola', 'Chidi', 'Dele'};

  print(morningClass.union(eveningClass)); // Everyone
  print(morningClass.intersection(eveningClass)); // In both: Bola and Chidi
  print(morningClass.difference(eveningClass)); // Morning only: Ada
}
