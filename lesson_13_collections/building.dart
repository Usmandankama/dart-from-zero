// Lesson 13 · Working through collections: spread, collection if and for
//
// Run it:   dart run lesson_13_collections/building.dart

void main() {
  // --- Spread: pour one list into another ------------------------------------

  var drinks = ['Zobo', 'Kunu'];
  var foods = ['Jollof', 'Suya'];
  var menu = [...foods, ...drinks, 'Water'];
  print(menu); // [Jollof, Suya, Zobo, Kunu, Water]

  // ...? skips a list that's null.
  int hour = 13;
  List<String>? specials = hour >= 18 ? ['Moi Moi'] : null;
  print([...menu, ...?specials]);

  // --- Collection if: include an item only when something is true ------------

  var lunchMenu = ['Rice', if (hour >= 12) 'Pepper Soup', 'Water'];
  print(lunchMenu); // [Rice, Pepper Soup, Water]

  // --- Collection for: build items with a loop -------------------------------

  var squares = [for (int i = 1; i <= 5; i++) i * i];
  print(squares); // [1, 4, 9, 16, 25]

  var tags = [for (var food in foods) '#$food'];
  print(tags); // [#Jollof, #Suya]

  // --- All of them work in maps and sets too ---------------------------------

  var defaults = {'theme': 'light', 'language': 'English'};
  var settings = {...defaults, 'language': 'Hausa'}; // Later keys win.
  print(settings); // {theme: light, language: Hausa}

  var lengths = {for (var food in foods) food: food.length};
  print(lengths); // {Jollof: 6, Suya: 4}
}
