import 'student.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final int credits;
  final String instructor;
  final List<String> prerequisites;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.credits,
    required this.instructor,
    List<String>? prerequisites,
  }) : prerequisites = prerequisites ?? [];

  bool hasPrerequisites() => prerequisites.isNotEmpty;

  // Перевіряє, чи склав студент усі попередні обов'язкові курси
  bool canStudentEnroll(Student student) {
    final passed = student.getPassedCourses();
    return prerequisites.every((reqCourseId) => passed.contains(reqCourseId));
  }

  @override
  String toString() =>
      'Course($id: "$name", credits: $credits, instructor: $instructor)';
}
