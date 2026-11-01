// Lesson 3 · Solutions
//
// Run it:   dart run lesson_03_variables/solutions.dart

void main() {
  // 1.
  String name = 'Chidi Okafor';
  int age = 24;
  double heightM = 1.78;
  bool ownsLaptop = true;
  print(name);
  print(age);
  print(heightM);
  print(ownsLaptop);

  // 2.
  age = 25;
  print(age);

  // 3.
  final today = DateTime.now();
  const daysInAWeek = 7;
  print(today);
  print(daysInAWeek);

  // 4. The error says: A value of type 'String' can't be assigned to a
  //    variable of type 'int'.
}
