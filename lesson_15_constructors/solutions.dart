// Lesson 15 · Solutions
//
// Run it:   dart run lesson_15_constructors/solutions.dart

// 1 and 2.
class Phone {
  final String brand;
  final int price;
  final String colour;

  Phone({required this.brand, required this.price, this.colour = 'Black'});

  Phone.used(this.brand, int newPrice)
    : price = newPrice ~/ 2,
      colour = 'Black';

  @override
  String toString() => '$colour $brand: ₦$price';
}

// 3.
class Circle {
  final double radius;
  final double area;

  Circle(this.radius) : area = 3.14 * radius * radius;
}

// 4.
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

// 5.
class Colour {
  final String name;

  Colour._(this.name);

  static final Map<String, Colour> _made = {};

  factory Colour.fromName(String name) {
    return _made.putIfAbsent(name, () => Colour._(name));
  }
}

void main() {
  print(Phone(brand: 'Tecno', price: 180000));
  print(Phone(brand: 'Infinix', price: 150000, colour: 'Blue'));
  print(Phone.used('Samsung', 400000));

  print(Circle(2).area); // 12.56

  const a = Point(1, 2);
  const b = Point(1, 2);
  print(identical(a, b)); // true

  print(identical(Colour.fromName('Red'), Colour.fromName('Red'))); // true
}
