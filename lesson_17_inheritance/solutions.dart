// Lesson 17 · Solutions
//
// Run it:   dart run lesson_17_inheritance/solutions.dart

// 1 and 6.
class Employee {
  final String name;
  final int salary;

  Employee(this.name, this.salary);

  int pay() => salary;

  @override
  String toString() => '$name earns ₦${pay()}';
}

// 2 and 5.
class Manager extends Employee {
  final int bonus;

  Manager(super.name, super.salary, this.bonus);

  @override
  int pay() => super.pay() + bonus;

  void approveLeave() {
    print('$name approved the leave.');
  }
}

// 3.
class Intern extends Employee {
  Intern(super.name, super.salary);

  @override
  int pay() => salary ~/ 2;
}

void main() {
  // 4.
  List<Employee> staff = [
    Employee('Sade', 200000),
    Manager('Obi', 400000, 100000),
    Intern('Lami', 120000),
  ];

  for (var person in staff) {
    print(person);
  }

  int total = staff.fold(0, (sum, person) => sum + person.pay());
  print(total); // 760000

  // 5.
  for (var person in staff) {
    if (person is Manager) {
      person.approveLeave();
    }
  }
}
