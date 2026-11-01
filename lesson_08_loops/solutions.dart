// Lesson 8 · Solutions
//
// Run it:   dart run lesson_08_loops/solutions.dart

void main() {
  // 1.
  for (int i = 1; i <= 12; i++) {
    print('7 x $i = ${7 * i}');
  }

  // 2.
  int total = 0;
  for (int i = 1; i <= 100; i++) {
    total += i;
  }
  print(total); // 5050

  // 3.
  int money = 1000;
  int months = 0;
  while (money < 100000) {
    money *= 2;
    months++;
  }
  print(months); // 7

  // 4.
  for (var city in ['Kano', 'Lagos', 'Enugu', 'Jos']) {
    if (city == 'Enugu') {
      break;
    }
    print(city);
  }

  // 5.
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0) {
      continue;
    }
    print(i);
  }
}
