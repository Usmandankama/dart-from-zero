// Lesson 13 · Solutions
//
// Run it:   dart run lesson_13_collections/solutions.dart

void main() {
  var scores = [45, 82, 67, 90, 33, 71];
  var names = ['Musa', 'Ngozi', 'Tayo', 'Halima'];

  // 1.
  print(scores.where((score) => score >= 50).toList());

  // 2.
  print(names.map((name) => name.toUpperCase()).toList());

  // 3.
  int total = scores.fold(0, (sum, score) => sum + score);
  print((total / scores.length).toStringAsFixed(1)); // 64.7

  // 4.
  print(scores.where((s) => s >= 50).map((s) => '$s%').toList());

  // 5.
  print(scores.any((score) => score == 100)); // false

  // 6.
  names.sort((a, b) => a.length - b.length);
  print(names);

  // 7.
  print([for (int i = 1; i <= 5; i++) i * 2]);

  // 8.
  int top = scores.fold(0, (most, s) => s > most ? s : most);
  print([...names, 'Efe', if (top > 85) 'Bonus']);
}
