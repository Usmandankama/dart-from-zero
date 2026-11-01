// Lesson 11 · Solutions
//
// Run it:   dart run lesson_11_lists/solutions.dart

void main() {
  // 1.
  var cities = ['Lagos', 'Kano', 'Enugu', 'Jos'];
  print(cities.first);
  print(cities.last);
  print(cities.length);

  // 2.
  cities.add('Ibadan');
  cities.insert(0, 'Abuja');
  cities.remove('Jos');
  print(cities);

  // 3.
  int total = 0;
  for (var price in [1200, 350, 800, 4000]) {
    total += price;
  }
  print(total); // 6350

  // 4.
  var numbers = [4, 19, 7, 42, 13];
  int biggest = numbers[0];
  for (var number in numbers) {
    if (number > biggest) {
      biggest = number;
    }
  }
  print(biggest); // 42

  // 5.
  for (int i = 0; i < cities.length; i++) {
    print('${i + 1}. ${cities[i]}');
  }
}
