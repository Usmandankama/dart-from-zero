// Lesson 11 · Lists
//
// Run it:   dart run lesson_11_lists/lists.dart

void main() {
  // --- Making a list ---------------------------------------------------------

  // A list keeps items in order. List<String> means it only holds Strings.
  List<String> names = ['Ada', 'Bola', 'Chinedu'];
  var scores = [70, 85, 62]; // Dart works out that this is a List<int>.
  List<String> empty = [];

  print(names);
  print(scores);
  print(empty);

  // --- Reading items ---------------------------------------------------------

  // Positions are called indexes, and they start at 0.
  print(names[0]); // Ada
  print(names[2]); // Chinedu
  print(names.length); // 3
  print(names.first); // Ada
  print(names.last); // Chinedu
  print(empty.isEmpty); // true
  print(names.contains('Bola')); // true
  print(names.indexOf('Bola')); // 1

  // print(names[3]); // Uncomment to see the crash: there's no item 3.

  // --- Changing items --------------------------------------------------------

  names[0] = 'Adaeze';
  print(names); // [Adaeze, Bola, Chinedu]

  // --- Adding and removing ---------------------------------------------------

  names.add('Dayo'); // On the end
  names.addAll(['Efe', 'Femi']); // Several on the end
  names.insert(1, 'Binta'); // At position 1
  print(names);

  names.remove('Efe'); // By value
  names.removeAt(0); // By position
  names.removeLast();
  print(names);

  // --- Sorting ---------------------------------------------------------------

  scores.sort(); // This changes the list itself.
  print(scores); // [62, 70, 85]
  print(scores.reversed.toList()); // [85, 70, 62]

  // --- Looping ---------------------------------------------------------------

  for (var name in names) {
    print('Hello, $name');
  }

  // Use the index version when you need the position too.
  for (int i = 0; i < names.length; i++) {
    print('${i + 1}. ${names[i]}');
  }

  // --- final lists and const lists -------------------------------------------

  // final: the variable can't point to another list, but the list can change.
  final basket = ['Yam'];
  basket.add('Oil');
  print(basket);

  // const: nothing about it can change.
  const days = ['Sat', 'Sun'];
  print(days);
  // days.add('Mon'); // Uncomment to see the crash when it runs.

  // --- A list of lists -------------------------------------------------------

  var seats = [
    ['A1', 'A2'],
    ['B1', 'B2'],
  ];
  print(seats[1][0]); // B1
}
