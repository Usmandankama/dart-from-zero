// Lesson 20 · Enums
//
// Run it:   dart run lesson_20_enums/enums.dart

// --- A simple enum: a fixed list of choices ----------------------------------

enum OrderStatus { placed, packed, delivered, cancelled }

// Why not use text? 'delievered' has a typo that nothing would ever catch.
// OrderStatus.delievered is a red line straight away.

String message(OrderStatus status) {
  // A switch must cover every value, so Dart tells you if you forget one.
  return switch (status) {
    OrderStatus.placed => 'We have your order',
    OrderStatus.packed => 'It is on its way out',
    OrderStatus.delivered => 'Enjoy!',
    OrderStatus.cancelled => 'Your order was cancelled',
  };
}

// --- An enhanced enum: each value carries its own data -----------------------

enum Network {
  mtn('MTN', '0803', 350),
  airtel('Airtel', '0802', 300),
  glo('Glo', '0805', 250);

  // Enum fields are always final, and the constructor is always const.
  final String label;
  final String prefix;
  final int pricePerGb;

  const Network(this.label, this.prefix, this.pricePerGb);

  // Enums can have getters and methods.
  bool get isCheapest => pricePerGb == 250;

  int cost(int gigabytes) => gigabytes * pricePerGb;

  static Network? forPhone(String phone) {
    for (var network in values) {
      if (phone.startsWith(network.prefix)) {
        return network;
      }
    }
    return null;
  }
}

void main() {
  var status = OrderStatus.packed;

  print(status); // OrderStatus.packed
  print(status.name); // packed
  print(status.index); // 1: its position in the list
  print(status == OrderStatus.packed); // true
  print(message(status));

  // values is a list of them all.
  for (var value in OrderStatus.values) {
    print(value.name);
  }

  // byName turns text back into an enum value.
  print(OrderStatus.values.byName('delivered')); // OrderStatus.delivered

  print(Network.mtn.label); // MTN
  print(Network.airtel.cost(5)); // 1500
  print(Network.glo.isCheapest); // true
  print(Network.forPhone('08051234567')?.label); // Glo
  print(Network.forPhone('07001234567')?.label); // null
}
