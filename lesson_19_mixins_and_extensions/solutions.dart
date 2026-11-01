// Lesson 19 · Solutions
//
// Run it:   dart run lesson_19_mixins_and_extensions/solutions.dart

// 1.
mixin Discountable {
  int discounted(int price, int percent) => price - (price * percent ~/ 100);
}

// 2.
mixin Taxable {
  double withVat(int price) => price * 1.075;
}

// 3.
class Sale with Discountable, Taxable {}

// 4.
extension Initials on String {
  String get initials => split(' ').map((word) => word[0]).join();
}

// 5.
extension LeapYear on int {
  bool get isLeapYear => this % 4 == 0;
}

// 6.
extension Longest on List<String> {
  String longest() {
    return reduce((best, item) => item.length > best.length ? item : best);
  }
}

void main() {
  var sale = Sale();
  print(sale.discounted(10000, 20)); // 8000
  print(sale.withVat(2000)); // 2150.0

  print('Ngozi Okonjo'.initials); // NO
  print(2028.isLeapYear); // true
  print(['Jos', 'Maiduguri', 'Kano'].longest()); // Maiduguri
}
