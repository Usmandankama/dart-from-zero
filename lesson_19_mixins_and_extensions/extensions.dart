// Lesson 19 · Extensions
//
// Run it:   dart run lesson_19_mixins_and_extensions/extensions.dart

// --- An extension adds methods to a type you didn't write --------------------

extension NairaFormat on int {
  // this is the number itself. 1200000 becomes ₦1,200,000.
  String get naira {
    final digits = toString();
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(digits[i]);
    }
    return '₦$buffer';
  }

  int percentOf(int whole) => this * whole ~/ 100;
}

extension Tidy on String {
  String get capitalised {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  bool get isNigerianPhone => length == 11 && startsWith('0');
}

extension Totals on List<int> {
  int get total => fold(0, (sum, number) => sum + number);
}

void main() {
  print(1200000.naira); // ₦1,200,000
  print(950.naira); // ₦950
  print(15.percentOf(2000)); // 300

  print('lAgOs'.capitalised); // Lagos
  print('08012345678'.isNigerianPhone); // true

  print([1200, 350, 800].total); // 2350
  print([1200, 350, 800].total.naira); // ₦2,350
}
