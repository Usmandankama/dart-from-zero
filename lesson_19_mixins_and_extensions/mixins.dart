// Lesson 19 · Mixins
//
// Run it:   dart run lesson_19_mixins_and_extensions/mixins.dart

// --- A mixin is a bundle of code you can add to any class --------------------

mixin Rechargeable {
  int batteryPercent = 100;

  void charge() {
    batteryPercent = 100;
    print('Fully charged');
  }

  void useBattery(int amount) {
    batteryPercent -= amount;
    print('Battery at $batteryPercent%');
  }
}

mixin HasCamera {
  void takePhoto() {
    print('Click!');
  }
}

class Device {
  final String name;

  Device(this.name);
}

// --- with: use one mixin or several ------------------------------------------

class Phone extends Device with Rechargeable, HasCamera {
  Phone(super.name);
}

class Torch extends Device with Rechargeable {
  Torch(super.name);
}

// A class with no parent can use a mixin too.
class Doorbell with HasCamera {}

// --- on: a mixin that only works for certain classes -------------------------

// It can use name, because it only ever goes on a Device.
mixin Labelled on Device {
  String get label => 'Device: $name';
}

class Radio extends Device with Labelled {
  Radio(super.name);
}

void main() {
  var phone = Phone('Tecno');
  phone.useBattery(30); // Battery at 70%
  phone.takePhoto(); // Click!
  phone.charge(); // Fully charged

  Torch('Rechargeable lamp').useBattery(10); // Battery at 90%
  Doorbell().takePhoto(); // Click!
  print(Radio('FM').label); // Device: FM

  // A phone counts as all of these.
  Object thing = phone;
  print(thing is Device); // true
  print(thing is Rechargeable); // true
}
