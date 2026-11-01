// Lesson 18 · Abstract classes and interfaces
//
// Run it:   dart run lesson_18_abstract_classes/abstract_classes.dart

// --- An abstract class is a shape to fill in. You can't build one directly. ---

abstract class PaymentMethod {
  final String label;

  PaymentMethod(this.label);

  // No body: every child must write its own.
  bool pay(int amount);

  // A normal method: every child gets this as it is.
  void receipt(int amount) {
    print('Paid ₦$amount by $label');
  }
}

class Cash extends PaymentMethod {
  int inHand;

  Cash(this.inHand) : super('cash');

  @override
  bool pay(int amount) {
    if (amount > inHand) {
      return false;
    }
    inHand -= amount;
    return true;
  }
}

class BankTransfer extends PaymentMethod {
  final String bank;

  BankTransfer(this.bank) : super('$bank transfer');

  @override
  bool pay(int amount) => amount <= 5000000; // The bank's own limit.
}

// --- implements: a promise to have the same methods --------------------------

// Dart has no separate word for "interface": every class is one.
abstract class Printable {
  String printLine();
}

// implements inherits nothing, so you write everything yourself. A class can
// extend only one parent, but it can implement as many classes as you like.
class Invoice implements Printable {
  final int amount;

  Invoice(this.amount);

  @override
  String printLine() => 'Invoice for ₦$amount';
}

class Customer implements Printable {
  final String name;

  Customer(this.name);

  @override
  String printLine() => 'Customer: $name';
}

// --- Polymorphism: one piece of code, many kinds of object -------------------

// This doesn't care how the payment works, only that it's a PaymentMethod.
void checkout(PaymentMethod method, int amount) {
  if (method.pay(amount)) {
    method.receipt(amount);
  } else {
    print('Payment by ${method.label} failed');
  }
}

void printAll(List<Printable> items) {
  for (var item in items) {
    print(item.printLine());
  }
}

void main() {
  // var method = PaymentMethod('x'); // Uncomment: abstract classes can't be built.

  checkout(Cash(2000), 1500);
  checkout(Cash(1000), 1500);
  checkout(BankTransfer('GTBank'), 250000);

  // A new payment type would need no change to checkout. That's the point.
  printAll([Invoice(9000), Customer('Blessing')]);
}
