// Lesson 20 · Solutions
//
// Run it:   dart run lesson_20_enums/solutions.dart

// 1.
enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

// 2.
bool isWeekend(Day day) {
  return switch (day) {
    Day.saturday || Day.sunday => true,
    _ => false,
  };
}

// 3.
enum Size {
  small('S', 2000),
  medium('M', 3500),
  large('L', 5000);

  final String label;
  final int price;

  const Size(this.label, this.price);

  // 4.
  int priceOf(int quantity) => price * quantity;

  // 5.
  static Size? fromLabel(String text) {
    for (var size in values) {
      if (size.label == text) {
        return size;
      }
    }
    return null;
  }
}

void main() {
  for (var day in Day.values) {
    print(day.name);
  }

  print(isWeekend(Day.sunday)); // true
  print(isWeekend(Day.tuesday)); // false

  print(Size.medium.priceOf(2)); // 7000
  print(Size.fromLabel('L')); // Size.large
  print(Size.fromLabel('XL')); // null
}
