// Lesson 6 · Null safety: reading what someone types
//
// Run it:   dart run lesson_06_null_safety/input.dart

import 'dart:io'; // stdin lives here. Lesson 16 explains import.

void main() {
  stdout.write('What is your name? '); // write stays on the same line.

  // readLineSync waits for the Enter key. It gives a String?, because there
  // might be no input at all.
  String? name = stdin.readLineSync();
  print('Hello, ${name ?? 'stranger'}!');

  stdout.write('How old are you? ');
  String typed = stdin.readLineSync() ?? '';

  // Everything typed is text, even numbers. tryParse turns it into a number,
  // and gives null if someone typed "twenty".
  int? age = int.tryParse(typed);

  if (age == null) {
    print('"$typed" is not a number.');
  } else {
    print('Next year you will be ${age + 1}.');
  }
}
