// Lesson 5 · Strings
//
// Run it:   dart run lesson_05_strings/strings.dart

void main() {
  const name = 'Peak Milk';
  const price = 850;

  // --- Putting values in text ------------------------------------------------

  // $name drops a value into the text. ${...} works for anything longer.
  print('$name costs ₦$price');
  print('Three cost ₦${price * 3}');
  print('The name has ${name.length} characters');

  // A backslash lets you use a quote or a dollar sign as plain text.
  print('It\'s only \$2');

  // + joins text, but $ is usually easier to read.
  const brand = 'Peak';
  const product = ' Milk';
  print(brand + product); // Peak Milk

  // --- Asking text about itself ----------------------------------------------

  print(name.length); // 9
  print(name.isEmpty); // false
  print(name.contains('Milk')); // true
  print(name.startsWith('Peak')); // true
  print(name.endsWith('Tea')); // false
  print(name.indexOf('Milk')); // 5: counting starts at 0

  // --- Making changed copies -------------------------------------------------

  // Text never changes. These all give you back a new string.
  print(name.toUpperCase()); // PEAK MILK
  print(name.toLowerCase()); // peak milk
  print(name.replaceAll('Milk', 'Tea')); // Peak Tea
  print(name.substring(0, 4)); // Peak: from 0, stopping before 4
  print('  spaces  '.trim()); // spaces
  print('5'.padLeft(2, '0')); // 05
  print('Rice,Beans,Garri'.split(',')); // [Rice, Beans, Garri]

  // Decimal numbers can be shown with a set number of places, like money.
  print(2400.5.toStringAsFixed(2)); // 2400.50

  // --- Text over several lines -----------------------------------------------

  // Three quotes keep the line breaks exactly as you type them.
  print('''
Thank you for shopping.
You bought $name.''');

  // \n starts a new line inside ordinary text.
  print('Line one\nLine two');
}
