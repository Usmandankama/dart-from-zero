// Lesson 22 · Solutions
//
// Run it:   dart run lesson_22_records_and_patterns/solutions.dart

// 1.
({int min, int max}) minMax(List<int> numbers) {
  int min = numbers.first;
  int max = numbers.first;
  for (var number in numbers) {
    if (number < min) {
      min = number;
    }
    if (number > max) {
      max = number;
    }
  }
  return (min: min, max: max);
}

// 3.
String describe(Object value) {
  return switch (value) {
    [] => 'empty list',
    [_] => 'one item',
    String word when word.length > 5 => 'a long word',
    _ => 'something else',
  };
}

// 4 and 5.
sealed class Shape {}

class Square extends Shape {
  final double side;

  Square(this.side);
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);
}

class Triangle extends Shape {
  final double base;
  final double height;

  Triangle(this.base, this.height);
}

double area(Shape shape) {
  return switch (shape) {
    Square(:var side) => side * side,
    Circle(:var radius) => 3.14 * radius * radius,
    Triangle(:var base, :var height) => base * height / 2,
  };
}

void main() {
  var (:min, :max) = minMax([4, 19, 7]);
  print('$min to $max'); // 4 to 19

  // 2.
  var student = (name: 'Hauwa', score: 72);
  if (student case (name: var name, score: var score) when score >= 50) {
    print('$name passed');
  }

  print(describe([])); // empty list
  print(describe(['a'])); // one item
  print(describe('Maiduguri')); // a long word
  print(describe(42)); // something else

  print(area(Square(2))); // 4.0
  print(area(Circle(1))); // 3.14
  print(area(Triangle(4, 3))); // 6.0

  // 5. Before the fix, the analyzer says: The type 'Shape' isn't exhaustively
  //    matched by the switch cases since it doesn't match the pattern
  //    'Triangle()'.
}
