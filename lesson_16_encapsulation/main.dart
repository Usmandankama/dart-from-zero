// Lesson 16 · Getters, setters, private and static
//
// Run it:   dart run lesson_16_encapsulation/main.dart

// --- import brings in code from somewhere else -------------------------------

import 'dart:math'; // Dart's own libraries start with dart:

import 'dart:math'
    as maths
    show pi; // as gives it a name. show picks one thing.

import 'wallet.dart'; // Your own files use a path.

void main() {
  var wallet = Wallet('Zainab');

  // --- Getters and setters look like fields ----------------------------------

  wallet.deposit(5000);
  print(wallet.balance); // 5000
  print(wallet.isEmpty); // false
  print(wallet.summary); // Zainab has ₦5000

  wallet.owner = '  Zainab Sani ';
  print(wallet.owner); // Zainab Sani

  wallet.owner = ''; // Refused by the setter's check.

  // wallet.balance = 1000000; // Uncomment: balance has a getter but no setter.
  // print(wallet._balance); // Uncomment: this file can't see private names.

  // --- Methods ---------------------------------------------------------------

  print(wallet.pay(2000)); // true
  print(wallet.pay(9000)); // false
  print(wallet.balance); // 3000

  wallet.deposit(-50); // Refused

  // --- static: reached through the class name --------------------------------

  print(Wallet.dailyLimit); // 500000
  print(Wallet.limitMessage());

  Wallet('Kunle');
  print(Wallet.walletsCreated); // 2

  // --- Using the imports -----------------------------------------------------

  print(max(4, 9)); // 9: from dart:math
  print(maths.pi.toStringAsFixed(2)); // 3.14
}
