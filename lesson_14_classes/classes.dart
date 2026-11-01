// Lesson 14 · Classes and objects
//
// Run it:   dart run lesson_14_classes/classes.dart

// --- A class is a blueprint. An object is one thing built from it. -----------

class Student {
  // Fields: what every student knows about itself.
  String name;
  int level;
  List<int> scores = [];

  // A constructor builds an object. this.name stores the value in the field.
  Student(this.name, this.level);

  // Methods: what every student can do.
  void addScore(int score) {
    scores.add(score);
  }

  double average() {
    if (scores.isEmpty) {
      return 0;
    }
    int total = scores.fold(0, (sum, score) => sum + score);
    return total / scores.length;
  }

  // this means "this object". You need it when a parameter has the same name
  // as a field.
  void moveTo(int level) {
    this.level = level;
  }

  void introduce() {
    print('I am $name, in level $level.');
  }

  // Dart calls toString when it prints an object. Lesson 17 explains @override.
  @override
  String toString() => 'Student($name, level $level)';
}

void main() {
  // Each object has its own copy of the fields.
  var ada = Student('Ada', 100);
  var musa = Student('Musa', 200);

  // A dot reaches inside an object.
  print(ada.name); // Ada
  print(musa.level); // 200

  ada.addScore(70);
  ada.addScore(90);
  print(ada.average()); // 80.0
  print(musa.average()); // 0.0: Musa's scores are separate

  musa.moveTo(300);
  musa.introduce(); // I am Musa, in level 300.

  print(ada); // Student(Ada, level 100)

  // A list can hold objects, like anything else.
  var classroom = [ada, musa];
  for (var student in classroom) {
    student.introduce();
  }

  // Two variables can point to the very same object.
  var sameAda = ada;
  sameAda.name = 'Adaeze';
  print(ada.name); // Adaeze
}
