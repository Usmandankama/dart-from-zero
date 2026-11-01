// Lesson 5 · Solutions
//
// Run it:   dart run lesson_05_strings/solutions.dart

void main() {
  // 1.
  const person = 'Ngozi';
  const state = 'Enugu';
  print('$person is from $state.');

  // 2.
  const platePrice = 1500;
  print('4 plates cost ₦${platePrice * 4}.');

  // 3.
  print('  ada@example.com  '.trim().toUpperCase());

  // 4.
  const shop = 'Mama Nkechi';
  print(shop.contains('Nkechi')); // true
  print(shop.replaceAll('Mama', 'Aunty')); // Aunty Nkechi

  // 5.
  print('Tomato,Pepper,Onion'.split(',')); // [Tomato, Pepper, Onion]

  // 6.
  print('''
Jollof rice x4
Total: ₦6000''');
}
