// Lesson 21 · Exercises
//
// Try these yourself, then compare with solutions.dart.
// Run it:   dart run lesson_21_generics/exercises.dart

// Write your classes and functions up here, then use them from main.

void main() {
  // 1. Write a generic class Shelf<T> that holds a list of items, with methods
  //    add and count. Make one shelf of String and one of int.

  // 2. Add a method to Shelf called firstMatching. It takes a bool Function(T)
  //    and returns the first matching item, or null.

  // 3. Write a generic function lastOf<T> that returns the last item in a list,
  //    or null if the list is empty.

  // 4. Write a class Result<T> with a T? value and a String? error, and a getter
  //    isOk. Use it to hold a number, then to hold an error message.

  // 5. Write biggest<T extends num> that returns the largest item in a list.
}
