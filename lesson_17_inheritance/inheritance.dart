// Lesson 17 · Inheritance
//
// Run it:   dart run lesson_17_inheritance/inheritance.dart

// --- A parent class holds what every vehicle has in common -------------------

class Vehicle {
  final String plate;
  final int seats;

  Vehicle(this.plate, this.seats);

  int fare(int distanceKm) => distanceKm * 100;

  void describe() {
    print('$plate: $seats seat(s), ₦${fare(10)} for 10 km.');
  }
}

// --- extends: a child class gets everything from its parent ------------------

class Danfo extends Vehicle {
  // super(...) passes values up to the parent's constructor.
  Danfo(String plate) : super(plate, 18);
}

class Keke extends Vehicle {
  bool hasRainCover;

  Keke(String plate, {this.hasRainCover = false}) : super(plate, 3);

  // --- @override: replace something from the parent --------------------------

  @override
  int fare(int distanceKm) => distanceKm * 150;
}

class Okada extends Vehicle {
  Okada(String plate) : super(plate, 1);

  @override
  int fare(int distanceKm) {
    // super reaches the parent's version, so you can build on it.
    return super.fare(distanceKm) + 200;
  }

  @override
  void describe() {
    super.describe();
    print('Helmet required!');
  }

  // A child can add things its parent doesn't have.
  void weaveThroughTraffic() {
    print('$plate is weaving through traffic.');
  }
}

void main() {
  var danfo = Danfo('LAG-101');
  var keke = Keke('KAN-202', hasRainCover: true);
  var okada = Okada('ABJ-303');

  danfo.describe(); // Uses Vehicle's fare.
  keke.describe(); // Uses Keke's fare.
  okada.describe(); // Uses Okada's fare and describe.

  // --- A child IS a parent ---------------------------------------------------

  // So a list of Vehicle can hold all of them. Each one uses its own fare.
  List<Vehicle> fleet = [danfo, keke, okada];
  for (var vehicle in fleet) {
    print('${vehicle.plate}: ₦${vehicle.fare(5)}');
  }

  // --- is and as -------------------------------------------------------------

  // is asks what an object really is. Inside the if, Dart treats it as one.
  for (var vehicle in fleet) {
    if (vehicle is Okada) {
      vehicle.weaveThroughTraffic();
    }
  }

  // as says "treat this as that". It crashes if you're wrong, so prefer is.
  Vehicle first = fleet[1];
  print((first as Keke).hasRainCover); // true

  // --- Every class extends Object --------------------------------------------

  // That's where toString comes from, and why lesson 14 used @override on it.
  print(danfo); // Instance of 'Danfo'
}
