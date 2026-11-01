// Lesson 10 · Solutions
//
// Run it:   dart run lesson_10_functions_as_values/solutions.dart

// 1.
int cube(int number) => number * number * number;

// 2.
void repeat(int times, void Function() action) {
  for (int i = 0; i < times; i++) {
    action();
  }
}

// 3.
int calculate(int a, int b, int Function(int, int) operation) {
  return operation(a, b);
}

// 4.
int Function(int) makeMultiplier(int by) {
  return (number) => number * by;
}

void main() {
  print(cube(3)); // 27

  repeat(2, () {
    print('Hello');
  });

  print(calculate(4, 5, (a, b) => a + b)); // 9
  print(calculate(4, 5, (a, b) => a * b)); // 20

  var triple = makeMultiplier(3);
  print(triple(7)); // 21
}
