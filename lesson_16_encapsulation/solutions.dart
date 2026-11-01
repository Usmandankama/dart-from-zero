// Lesson 16 · Solutions
//
// Run it:   dart run lesson_16_encapsulation/solutions.dart

import 'dart:math';

import 'student.dart';

void main() {
  var student = Student('Ifeoma');

  student.score = 45;
  print(student.grade); // Fail

  student.score = 150; // 150 is not a valid score.
  print(student.score); // 45

  student.addBonus(80);
  print(student.score); // 100
  print(student.grade); // Pass

  Student('Garba');
  print(Student.count); // 2

  // 5. The error says: The getter '_score' isn't defined for the type 'Student'.

  // 6.
  print(sqrt(144)); // 12.0
}
