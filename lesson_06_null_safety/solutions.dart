// Lesson 6 · Solutions
//
// Run it:   dart run lesson_06_null_safety/solutions.dart

import 'dart:io';

void main() {
  // 1.
  String? middleName;
  print(middleName ?? 'None');

  // 2.
  print(int.tryParse('45') ?? 0); // 45
  print(int.tryParse('forty-five') ?? 0); // 0

  // 3.
  int? count = int.tryParse('many');
  print(count?.isEven); // null

  // 4.
  stdout.write('How many plates of rice? ');
  int? plates = int.tryParse(stdin.readLineSync() ?? '');
  if (plates == null) {
    print('Please type a number, like 2.');
  } else {
    print('That will be ₦${plates * 1500}.');
  }
}
