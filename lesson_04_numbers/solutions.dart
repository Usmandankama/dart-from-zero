// Lesson 4 · Solutions
//
// Run it:   dart run lesson_04_numbers/solutions.dart

void main() {
  // 1.
  print(75000 * 3); // 225000

  // 2.
  int students = 53;
  int perBus = 14;
  print(students ~/ perBus); // 3 full buses
  print(students % perBus); // 11 left over

  // 3.
  int money = 5000;
  bool shopIsOpen = true;
  print(money >= 4500 && shopIsOpen); // true

  // 4.
  print(int.parse('1500') + 500); // 2000

  // 5. They're different: round gives 8, and toInt gives 7.
  print(7.5.round());
  print(7.5.toInt());
}
