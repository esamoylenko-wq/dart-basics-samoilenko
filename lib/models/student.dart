class Student {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> enrolledCourses;
  final Map<String, double> grades;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    List<String>? enrolledCourses,
    Map<String, double>? grades,
  })  : enrolledCourses = enrolledCourses ?? [],
        grades = grades ?? {};

  // Getters (обчислювані властивості)
  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  double get gpa {
    if (grades.isEmpty) return 0.0;
    double sum = grades.values.reduce((a, b) => a + b);
    return sum / grades.length;
  }

  // Методи роботи з курсами та оцінками
  void enrollInCourse(String courseId) {
    if (!enrolledCourses.contains(courseId)) {
      enrolledCourses.add(courseId);
    }
  }

  void addGrade(String courseId, double grade) {
    if (grade < 0 || grade > 100) {
      throw ArgumentError('Оцінка має бути від 0 до 100');
    }
    enrollInCourse(courseId);
    grades[courseId] = grade;
  }

  List<String> getPassedCourses() {
    return grades.entries
        .where((entry) => entry.value >= 60)
        .map((entry) => entry.key)
        .toList();
  }

  @override
  String toString() =>
      'Student($id: $fullName, age: $age, GPA: ${gpa.toStringAsFixed(1)})';

  // Перетворення об'єкта у JSON (знадобиться у Завданні 5)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'enrolledCourses': enrolledCourses,
      'grades': grades,
    };
  }

  // Створення об'єкта Student із JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
      grades: (json['grades'] as Map<String, dynamic>? ?? {})
          .map((key, value) => MapEntry(key, (value as num).toDouble())),
    );
  }
}
