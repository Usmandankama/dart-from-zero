// Lesson 16 · Solutions: the Student class
//
// This file has no main. solutions.dart imports it and uses the class.

class Student {
  final String name;
  int _score = 0;

  // 4.
  static int count = 0;

  Student(this.name) {
    count++;
  }

  // 1.
  int get score => _score;

  set score(int value) {
    if (value < 0 || value > 100) {
      print('$value is not a valid score.');
      return;
    }
    _score = value;
  }

  // 2.
  String get grade => _score >= 50 ? 'Pass' : 'Fail';

  // 3.
  int _clamp(int value) => value > 100 ? 100 : value;

  void addBonus(int bonus) {
    _score = _clamp(_score + bonus);
  }
}
