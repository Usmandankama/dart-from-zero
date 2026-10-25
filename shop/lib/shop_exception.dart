// Our own kind of exception, for things that go wrong in a normal day at the
// shop: selling more than you have, adding a product twice. The message is
// written for the person using the app, so it's fine to print it.
class ShopException implements Exception {
  final String message;

  ShopException(this.message);

  @override
  String toString() => message;
}
