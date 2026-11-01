// Lesson 22 · Records and patterns: patterns
//
// Run it:   dart run lesson_22_records_and_patterns/patterns.dart

// --- A pattern checks the shape of a value and pulls parts out of it ---------

String describeOrder(Object order) {
  return switch (order) {
    // A record with an int and a String. Their values land in the variables.
    (int quantity, String item) => '$quantity x $item',

    // A list with exactly two items.
    [var first, var second] => '$first and $second',

    // A list with at least one item. ... means "and the rest".
    [var first, ...] => '$first and more',

    // when adds an extra condition, called a guard.
    int amount when amount > 10000 => 'A big order of ₦$amount',
    int amount => 'An order of ₦$amount',

    // A map with this key.
    {'item': String item} => 'Just $item',

    _ => 'Unknown order',
  };
}

// --- sealed: a family of classes with a fixed list of members ----------------

// All the children have to be in this file, so Dart knows the whole list. A
// switch on Payment doesn't need a default, and if you add a child, every switch
// that misses it becomes a red line.
sealed class Payment {}

class Paid extends Payment {
  final int amount;

  Paid(this.amount);
}

class Failed extends Payment {
  final String reason;

  Failed(this.reason);
}

class Pending extends Payment {}

String explain(Payment payment) {
  return switch (payment) {
    // Paid(:amount) checks the type and pulls out the field.
    Paid(:var amount) => 'Received ₦$amount',
    Failed(:var reason) => 'Failed: $reason',
    Pending() => 'Still waiting',
  };
}

void main() {
  print(describeOrder((3, 'Yam'))); // 3 x Yam
  print(describeOrder(['Rice', 'Beans'])); // Rice and Beans
  print(describeOrder(['Rice', 'Beans', 'Oil'])); // Rice and more
  print(describeOrder(50000)); // A big order of ₦50000
  print(describeOrder(900)); // An order of ₦900
  print(describeOrder({'item': 'Garri'})); // Just Garri
  print(describeOrder(1.5)); // Unknown order

  // --- if-case: check one pattern without a whole switch ---------------------

  var reply = ('ok', 200);
  if (reply case ('ok', int code)) {
    print('Worked, with code $code');
  }

  // --- Patterns unpack lists and maps too ------------------------------------

  var [winner, runnerUp, ...others] = ['Ada', 'Bola', 'Chidi', 'Dele'];
  print('$winner beat $runnerUp and ${others.length} others');

  var prices = {'Rice': 75000, 'Beans': 60000};
  for (var MapEntry(key: name, value: price) in prices.entries) {
    print('$name: ₦$price');
  }

  // --- Sealed classes --------------------------------------------------------

  print(explain(Paid(5000)));
  print(explain(Failed('Network error')));
  print(explain(Pending()));
}
