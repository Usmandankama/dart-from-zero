// Lesson 7 · Decisions: switch
//
// Run it:   dart run lesson_07_decisions/switch.dart

void main() {
  String day = 'Saturday';

  // --- The switch statement --------------------------------------------------

  // switch compares one value against many choices.
  switch (day) {
    case 'Monday':
      print('Back to work');
    case 'Friday':
      print('Almost the weekend');
    case 'Saturday' || 'Sunday': // || here means either of these.
      print('Weekend!');
    default: // Anything else.
      print('A normal day');
  }

  // --- The switch expression -------------------------------------------------

  // This form gives you back a value. _ means "anything else".
  String network = 'MTN';

  int pricePerGb = switch (network) {
    'MTN' => 350,
    'Airtel' => 300,
    'Glo' => 250,
    _ => 400,
  };
  print('1GB on $network costs ₦$pricePerGb');

  // Each choice can check a range of values too.
  int score = 67;

  String grade = switch (score) {
    >= 70 => 'A',
    >= 60 => 'B',
    >= 50 => 'C',
    _ => 'F',
  };
  print('Grade: $grade');
}
