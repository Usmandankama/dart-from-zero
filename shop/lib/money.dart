const naira = '₦';

// Turns 28800 into ₦28,800. It walks along the digits and puts a comma
// before every group of three, counting from the right.
String formatNaira(int amount) {
  String digits = amount.abs().toString();
  String result = '';
  for (var i = 0; i < digits.length; i++) {
    int digitsLeft = digits.length - i;
    if (i > 0 && digitsLeft % 3 == 0) {
      result += ',';
    }
    result += digits[i];
  }
  return amount < 0 ? '-$naira$result' : '$naira$result';
}
