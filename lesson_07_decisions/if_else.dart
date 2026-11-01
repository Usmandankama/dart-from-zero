// Lesson 7 · Decisions: if and else
//
// Run it:   dart run lesson_07_decisions/if_else.dart

void main() {
  int stock = 3;

  // --- if --------------------------------------------------------------------

  // The block only runs when the condition is true.
  if (stock < 5) {
    print('Running low!');
  }

  // --- else ------------------------------------------------------------------

  if (stock == 0) {
    print('Sold out');
  } else {
    print('$stock left');
  }

  // --- else if: more than two choices ----------------------------------------

  // Dart checks from the top and stops at the first one that's true.
  int score = 67;

  if (score >= 70) {
    print('A');
  } else if (score >= 60) {
    print('B');
  } else if (score >= 50) {
    print('C');
  } else {
    print('Try again');
  }

  // --- Combining conditions --------------------------------------------------

  int age = 20;
  bool hasId = true;

  if (age >= 18 && hasId) {
    print('You can open an account');
  }

  // --- condition ? this : that -----------------------------------------------

  // The ternary picks one of two values. It's great for short choices.
  String label = stock < 5 ? 'low' : 'fine';
  print(label);
  print('Status: ${stock == 0 ? 'sold out' : 'available'}');
}
