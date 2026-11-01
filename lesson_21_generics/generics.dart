// Lesson 21 · Generics
//
// Run it:   dart run lesson_21_generics/generics.dart

// --- You've been using generics already --------------------------------------

// List<String> is a list "of String". The type in the angle brackets fills in a
// blank, so one List class works for every type, and Dart still checks it.

// --- A generic class: T is a blank you fill in later -------------------------

class Box<T> {
  T item;

  Box(this.item);

  void swap(T newItem) {
    item = newItem;
  }

  @override
  String toString() => 'Box of $item';
}

// A practical one: last in, first out, like a pile of plates.
class Stack<T> {
  final List<T> _items = [];

  bool get isEmpty => _items.isEmpty;

  void push(T item) {
    _items.add(item);
  }

  T? pop() => isEmpty ? null : _items.removeLast();
}

// --- More than one blank -----------------------------------------------------

class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);
}

// --- A generic function ------------------------------------------------------

T? firstOrNull<T>(List<T> items) {
  return items.isEmpty ? null : items[0];
}

List<R> convertAll<T, R>(List<T> items, R Function(T) convert) {
  return [for (var item in items) convert(item)];
}

// --- extends: limit the blank to certain types -------------------------------

// T can be int or double, because both are num. That's why + works here.
T total<T extends num>(List<T> numbers, T start) {
  T sum = start;
  for (var number in numbers) {
    sum = (sum + number) as T;
  }
  return sum;
}

void main() {
  var nameBox = Box<String>('Ada');
  var ageBox = Box(30); // Dart works out that this is Box<int>.

  nameBox.swap('Bola');
  // nameBox.swap(99); // Uncomment to see the error: this box holds Strings.
  print(nameBox); // Box of Bola
  print(ageBox.item + 1); // 31: Dart knows it's an int

  var plates = Stack<String>();
  plates.push('Rice');
  plates.push('Beans');
  print(plates.pop()); // Beans
  print(plates.pop()); // Rice
  print(plates.pop()); // null

  var pair = Pair('Rice', 75000);
  print('${pair.first} costs ₦${pair.second}');

  print(firstOrNull(['a', 'b'])); // a
  print(firstOrNull(<int>[])); // null

  print(convertAll(['1', '22'], (text) => text.length)); // [1, 2]

  print(total([1, 2, 3], 0)); // 6
  print(total([1.5, 2.5], 0.0)); // 4.0
  // print(total(['a'], 'b')); // Uncomment to see the error: String isn't a num.
}
