// Lesson 14 · Solutions
//
// Run it:   dart run lesson_14_classes/solutions.dart

// 1, 2 and 4.
class Book {
  String title;
  String author;
  int pages;

  Book(this.title, this.author, this.pages);

  void describe() {
    print('$title by $author, $pages pages.');
  }

  @override
  String toString() => title;
}

// 3.
class Wallet {
  int balance;

  Wallet(this.balance);

  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount) {
    if (amount > balance) {
      print('Not enough money.');
      return;
    }
    balance -= amount;
  }
}

void main() {
  var first = Book('Things Fall Apart', 'Chinua Achebe', 209);
  var second = Book('Purple Hibiscus', 'Chimamanda Adichie', 307);
  print(first.title);
  print(second.title);

  first.describe();
  print(second);

  var wallet = Wallet(1000);
  wallet.deposit(500);
  wallet.withdraw(2000); // Not enough money.
  wallet.withdraw(300);
  print(wallet.balance); // 1200

  // 5.
  var books = [first, second];
  int pages = books.fold(0, (sum, book) => sum + book.pages);
  print(pages); // 516
}
