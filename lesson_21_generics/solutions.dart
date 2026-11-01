// Lesson 21 · Solutions
//
// Run it:   dart run lesson_21_generics/solutions.dart

// 1 and 2.
class Shelf<T> {
  final List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  int count() => _items.length;

  T? firstMatching(bool Function(T) test) {
    for (var item in _items) {
      if (test(item)) {
        return item;
      }
    }
    return null;
  }
}

// 3.
T? lastOf<T>(List<T> items) => items.isEmpty ? null : items.last;

// 4.
class Result<T> {
  final T? value;
  final String? error;

  Result({this.value, this.error});

  bool get isOk => error == null;
}

// 5.
T biggest<T extends num>(List<T> numbers) {
  T largest = numbers.first;
  for (var number in numbers) {
    if (number > largest) {
      largest = number;
    }
  }
  return largest;
}

void main() {
  var names = Shelf<String>();
  names.add('Ada');
  names.add('Ngozi');
  print(names.count()); // 2
  print(names.firstMatching((name) => name.length > 3)); // Ngozi

  var numbers = Shelf<int>();
  numbers.add(5);
  print(numbers.firstMatching((n) => n > 10)); // null

  print(lastOf([1, 2, 3])); // 3
  print(lastOf(<String>[])); // null

  print(Result<int>(value: 42).isOk); // true
  print(Result<int>(error: 'Not a number').isOk); // false

  print(biggest([4, 19, 7])); // 19
  print(biggest([1.5, 0.5])); // 1.5
}
