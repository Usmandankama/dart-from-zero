// Lesson 6 · Null safety
//
// Run it:   dart run lesson_06_null_safety/null_safety.dart

void main() {
  // --- Normal variables can't be null ----------------------------------------

  // null means "there's no value here".
  // int discount = null; // Uncomment to see the error.

  // --- A question mark means "might be missing" ------------------------------

  String? nickname; // No value yet, so it's null.
  print(nickname); // null

  // int.tryParse gives you a number, or null if the text isn't a number.
  int? good = int.tryParse('250');
  int? bad = int.tryParse('two hundred');
  print(good); // 250
  print(bad); // null

  // print(bad + 1); // Uncomment to see the error: bad might be null.

  // --- Way 1: ?? means "or else use this" ------------------------------------

  print(nickname ?? 'No nickname yet');
  print(bad ?? 0); // 0

  // ??= only fills the variable in if it's null.
  int? score = int.tryParse('none');
  score ??= 10;
  print(score); // 10

  // --- Way 2: ?. means "only if it isn't null" -------------------------------

  print(good?.isEven); // true
  print(bad?.isEven); // null, and no crash

  // --- Way 3: check first ----------------------------------------------------

  // After the check, Dart knows this can't be null inside the if.
  if (good != null) {
    print(good + 1); // 251
  }

  // --- Way 4: ! means "trust me, it's not null" ------------------------------

  // Use this rarely. If you're wrong, the program crashes.
  int? sure = int.tryParse('100');
  print(sure! + 1); // 101

  // int? wrong = int.tryParse('abc');
  // print(wrong! + 1); // Uncomment to see the crash.
}
