import 'package:test/test.dart';
import 'package:dart_basics_samoilenko/models/student.dart';
import 'package:dart_basics_samoilenko/models/course.dart';
import 'package:dart_basics_samoilenko/models/university.dart';

void main() {
  group('University Models Tests', () {
    test('Student GPA calculation and JSON serialization', () {
      final student = Student(
        id: 'S01',
        firstName: 'Yevhen',
        lastName: 'Samoilenko',
        birthDate: DateTime(2004, 8, 22),
      );
      student.addGrade('CS101', 90.0);
      student.addGrade('CS102', 80.0);

      expect(student.gpa, equals(85.0));
      expect(student.getPassedCourses(), containsAll(['CS101', 'CS102']));

      final restored = Student.fromJson(student.toJson());
      expect(restored.fullName, equals('Yevhen Samoilenko'));
      expect(restored.gpa, equals(85.0));
    });

    test('Course prerequisites validation', () {
      final student = Student(
        id: 'S02',
        firstName: 'Anna',
        lastName: 'Melnyk',
        birthDate: DateTime(2005, 3, 10),
      );
      final advancedCourse = Course(
        id: 'CS202',
        name: 'Mobile Dev',
        description: 'Flutter & Dart',
        credits: 5,
        instructor: 'Prof. Kovalenko',
        prerequisites: ['CS101'],
      );

      expect(advancedCourse.canStudentEnroll(student), isFalse);
      student.addGrade('CS101', 75.0);
      expect(advancedCourse.canStudentEnroll(student), isTrue);
    });

    test('University CRUD and statistics', () {
      final uni = University(name: 'KPI');
      final s1 = Student(
        id: 'S01',
        firstName: 'Test',
        lastName: 'User',
        birthDate: DateTime(2004, 1, 1),
        grades: {'CS101': 95.0},
      );
      uni.addStudent(s1);

      expect(uni.findStudentById('S01'), isNotNull);
      expect(uni.generateStatistics()['averageGPA'], equals(95.0));

      uni.removeStudent('S01');
      expect(uni.students, isEmpty);
    });
  });
}