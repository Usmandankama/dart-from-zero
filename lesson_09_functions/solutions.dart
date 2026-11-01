// Lesson 9 · Solutions
//
// Run it:   dart run lesson_09_functions/solutions.dart

// 1.
int square(int number) {
  return number * number;
}

// 2.
bool isAdult(int age) {
  return age >= 18;
}

// 3.
String greeting(String name, [String? timeOfDay]) {
  if (timeOfDay == null) {
    return 'Hello, $name';
  }
  return 'Good $timeOfDay, $name';
}

// 4.
int transportFare({required int distanceKm, int ratePerKm = 150}) {
  return distanceKm * ratePerKm;
}

// 5.
int biggest(int a, int b, int c) {
  int largest = a;
  if (b > largest) {
    largest = b;
  }
  if (c > largest) {
    largest = c;
  }
  return largest;
}

void main() {
  print(square(9)); // 81
  print(isAdult(17)); // false
  print(greeting('Tunde')); // Hello, Tunde
  print(greeting('Tunde', 'morning')); // Good morning, Tunde
  print(transportFare(distanceKm: 10)); // 1500
  print(transportFare(distanceKm: 10, ratePerKm: 200)); // 2000
  print(biggest(4, 19, 7)); // 19
}
