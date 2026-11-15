import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  // Робота з Lists
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((n) => n % 2 == 0).toList();
  }

  static Map<String, int> countWords(String text) {
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\sа-яА-ЯіІїЇєЄ]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty);

    final Map<String, int> counts = {};
    for (var word in words) {
      counts[word] = (counts[word] ?? 0) + 1;
    }
    return counts;
  }

  static List> sortStudentsByGPA(List<Student> students) {
    final sorted = List<Student>.from(students)
      ..sort((a, b) => b.gpa.compareTo(a.gpa));

    return sorted
        .map((s) => {
              'id': s.id,
              'name': s.fullName,
              'gpa': double.parse(s.gpa.toStringAsFixed(2)),
            })
        .toList();
  }

  // Робота з Sets
  static Set<String> getUniqueCourses(List<Student> students) {
    final Set<String> allCourses = {};
    for (var student in students) {
      allCourses.addAll(student.enrolledCourses);
    }
    return allCourses;
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) return {};
    Set<String> common = students.first.enrolledCourses.toSet();
    for (var student in students.skip(1)) {
      common = common.intersection(student.enrolledCourses.toSet());
    }
    return common;
  }

  // Робота з Maps
  static Map<int, List<Student>> groupStudentsByBirthYear(
      List<Student> students) {
    final Map<int, List<Student>> grouped = {};
    for (var student in students) {
      int year = student.birthDate.year;
      grouped.putIfAbsent(year, () => []).add(student);
    }
    return grouped;
  }

  static Map<String, double> calculateAverageGradesByCourse(
      List<Student> students) {
    final Map<String, List<double>> courseGrades = {};

    for (var student in students) {
      student.grades.forEach((courseId, grade) {
        courseGrades.putIfAbsent(courseId, () => []).add(grade);
      });
    }

    return courseGrades.map((courseId, gradesList) {
      double avg = gradesList.reduce((a, b) => a + b) / gradesList.length;
      return MapEntry(courseId, double.parse(avg.toStringAsFixed(2)));
    });
  }

  // Комплексний звіт по університету
  static List> generateReport(University university) {
    return university.courses.map((course) {
      final enrolled = university.getStudentsByCourse(course.id);
      double avgCourseGrade = 0.0;
      final grades = enrolled
          .where((s) => s.grades.containsKey(course.id))
          .map((s) => s.grades[course.id]!)
          .toList();

      if (grades.isNotEmpty) {
        avgCourseGrade = grades.reduce((a, b) => a + b) / grades.length;
      }

      return {
        'courseId': course.id,
        'courseName': course.name,
        'enrolledCount': enrolled.length,
        'averageGrade': double.parse(avgCourseGrade.toStringAsFixed(2)),
      };
    }).toList();
  }
}
