// Lesson 18 · Solutions
//
// Run it:   dart run lesson_18_abstract_classes/solutions.dart

// 1.
abstract class Shape {
  double area();

  void describe() {
    print('Area: ${area().toStringAsFixed(2)}');
  }
}

// 2.
class Square extends Shape {
  final double side;

  Square(this.side);

  @override
  double area() => side * side;
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

// 3.
double totalArea(List<Shape> shapes) {
  return shapes.fold(0, (sum, shape) => sum + shape.area());
}

// 4.
abstract class Notifier {
  void send(String message);
}

class Sms implements Notifier {
  @override
  void send(String message) {
    print('SMS: $message');
  }
}

class Email implements Notifier {
  @override
  void send(String message) {
    print('Email: $message');
  }
}

// 5.
void alertEveryone(List<Notifier> notifiers, String message) {
  for (var notifier in notifiers) {
    notifier.send(message);
  }
}

void main() {
  var shapes = [Square(2), Circle(1)];
  for (var shape in shapes) {
    shape.describe();
  }
  print(totalArea(shapes)); // 7.14

  alertEveryone([Sms(), Email()], 'The shop opens at 8');
}
