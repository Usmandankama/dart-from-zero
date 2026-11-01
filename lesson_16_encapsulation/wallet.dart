// Lesson 16 · Getters, setters, private and static: the Wallet class
//
// This file has no main. main.dart imports it and uses the class.

class Wallet {
  // A leading underscore makes a name private: only this file can see it.
  String _owner;
  int _balance = 0;

  // static belongs to the class itself, not to any one wallet.
  static const int dailyLimit = 500000;
  static int walletsCreated = 0;

  Wallet(this._owner) {
    walletsCreated++;
  }

  // A getter looks like a field from outside, but it runs code.
  int get balance => _balance;

  bool get isEmpty => _balance == 0;

  // A getter can work something out each time.
  String get summary => '$_owner has ₦$_balance';

  // A setter runs code when someone assigns a value, so it can check it.
  String get owner => _owner;

  set owner(String value) {
    if (value.trim().isEmpty) {
      print('A wallet needs an owner.');
      return;
    }
    _owner = value.trim();
  }

  void deposit(int amount) {
    if (amount <= 0 || amount > dailyLimit) {
      print('Deposit of ₦$amount refused.');
      return;
    }
    _balance += amount;
  }

  // A private method: a helper only this file can call.
  bool _canPay(int amount) => amount > 0 && amount <= _balance;

  bool pay(int amount) {
    if (!_canPay(amount)) {
      return false;
    }
    _balance -= amount;
    return true;
  }

  // A static method doesn't need a wallet to run.
  static String limitMessage() => 'The daily limit is ₦$dailyLimit';
}
