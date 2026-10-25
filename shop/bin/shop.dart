// Lesson 5 · Making decisions and repeating: if, switch and loops
//
// Run it from the shop folder:   dart run
// Type a menu number and press Enter. Type q to quit.

// dart:io lets the program read what you type in the terminal.
import 'dart:io';

void main() {
  const shopName = "Mama Nkechi's Shop";
  const naira = '₦';
  const lowStockLevel = 5;

  // One product for now. Lesson 7 gives the shop a whole list of them.
  String name = 'Golden Penny Spaghetti';
  int price = 1200;
  int stock = 24;

  // What the shop has sold since the program started.
  int packsSold = 0;
  int takings = 0;

  print('Welcome to $shopName');

  // --- The menu loop -------------------------------------------------------

  // while repeats its block for as long as the condition is true.
  // Choosing q sets running to false, so the loop stops.
  var running = true;
  while (running) {
    print('');
    print('1. Show the product');
    print('2. Sell');
    print('3. Restock');
    print('4. Price list');
    print('q. Quit');
    stdout.write('Choose: '); // write, unlike print, stays on the same line.

    // readLineSync waits for Enter and gives back what was typed. It's a
    // String?, because the input can end before anything is typed.
    String choice = stdin.readLineSync()?.trim() ?? 'q';

    // switch compares choice with each case and runs the one that matches.
    // In Dart 3, a case stops on its own: you don't need break.
    switch (choice) {
      case '1':
        print('$name: $naira$price each, $stock in stock');

        // if / else if / else: the first true condition wins.
        if (stock == 0) {
          print('Sold out!');
        } else if (stock <= lowStockLevel) {
          print('Running low. Order more soon.');
        }

      case '2':
        stdout.write('How many? ');
        int? quantity = int.tryParse(stdin.readLineSync() ?? '');

        // || means "or". The first check that's true stops the sale.
        if (quantity == null || quantity <= 0) {
          print('Please type a whole number above 0.');
        } else if (quantity > stock) {
          print('Sorry, only $stock left.');
        } else {
          stock -= quantity;
          packsSold += quantity;
          takings += quantity * price;
          print('Sold $quantity for $naira${quantity * price}. $stock left.');
        }

      case '3':
        stdout.write('How many arrived? ');
        int? arrived = int.tryParse(stdin.readLineSync() ?? '');
        if (arrived == null || arrived <= 0) {
          print('Please type a whole number above 0.');
        } else {
          stock += arrived;
          print('Restocked. $stock in stock now.');
        }

      case '4':
        // A for loop counts: start at 1, keep going while packs <= 5,
        // and add 1 each time round.
        for (var packs = 1; packs <= 5; packs++) {
          print('$packs x $name = $naira${packs * price}');
        }

      // || in a case means either of these.
      case 'q' || 'Q':
        running = false;

      // default runs when nothing else matched.
      default:
        print('Sorry, "$choice" is not on the menu.');
    }
  }

  print('');
  print('Today: $packsSold packs sold for $naira$takings. Goodbye!');
}
