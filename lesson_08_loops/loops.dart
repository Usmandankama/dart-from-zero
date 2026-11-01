// Lesson 8 · Loops
//
// Run it:   dart run lesson_08_loops/loops.dart

void main() {
  // --- for: when you know how many times -------------------------------------

  // Start at 1. Keep going while i is 5 or less. Add 1 each time.
  for (int i = 1; i <= 5; i++) {
    print('Customer number $i');
  }

  // --- for-in: one item at a time --------------------------------------------

  // Square brackets make a list. Lesson 11 covers lists properly.
  var foods = ['Jollof', 'Egusi', 'Suya'];

  for (var food in foods) {
    print('I like $food');
  }

  // --- while: when you don't know how many times -----------------------------

  // It checks the condition first, and keeps going while it's true.
  int savings = 0;
  int months = 0;

  while (savings < 50000) {
    savings += 12000;
    months++;
  }
  print('It took $months months to save ₦$savings');

  // --- do-while: always runs at least once -----------------------------------

  int tries = 10;
  do {
    print('This runs once, even though tries is $tries');
    tries++;
  } while (tries < 5);

  // --- break: stop the loop now ----------------------------------------------

  for (int i = 1; i <= 100; i++) {
    if (i * i > 30) {
      print('$i squared is the first square above 30');
      break;
    }
  }

  // --- continue: skip to the next round --------------------------------------

  for (int i = 1; i <= 6; i++) {
    if (i % 2 == 0) {
      continue; // Skip the even numbers.
    }
    print('$i is odd');
  }

  // --- A loop inside a loop --------------------------------------------------

  for (int row = 1; row <= 3; row++) {
    for (int column = 1; column <= 3; column++) {
      print('$row x $column = ${row * column}');
    }
  }
}
