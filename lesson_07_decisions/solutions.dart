// Lesson 7 · Solutions
//
// Run it:   dart run lesson_07_decisions/solutions.dart

void main() {
  // 1.
  int temperature = 33;
  if (temperature > 30) {
    print('Hot');
  } else if (temperature > 20) {
    print('Warm');
  } else {
    print('Cool');
  }

  // 2.
  int orderTotal = 15000;
  String city = 'Abuja';
  if (orderTotal >= 20000 || city == 'Abuja') {
    print('Free delivery');
  } else {
    print('Delivery costs extra');
  }

  // 3.
  int number = 7;
  print(number % 2 == 0 ? 'even' : 'odd');

  // 4.
  int month = 2;
  String monthName = switch (month) {
    1 => 'January',
    2 => 'February',
    3 => 'March',
    _ => 'Later in the year',
  };
  print(monthName);
}
