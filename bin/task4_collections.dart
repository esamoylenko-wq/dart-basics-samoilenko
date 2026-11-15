import 'package:dart_basics_samoilenko/models/student.dart';
import 'package:dart_basics_samoilenko/models/course.dart';
import 'package:dart_basics_samoilenko/models/university.dart';
import 'package:dart_basics_samoilenko/utils/data_processor.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

void demonstrateLists() {
  print('\n--- Lists Operations ---');
  List<int> numbers = [12, 7, 24, 35, 40, 19, 8];
  print('Original: $numbers');
  print('Even numbers: ${DataProcessor.filterEvenNumbers(numbers)}');

  int sum = numbers.fold(0, (acc, n) => acc + n);
  int maxVal = numbers.reduce((a, b) => a > b ? a : b);
  print('Sum (fold): $sum, Max (reduce): $maxVal');
}

void demonstrateSets() {
  print('\n--- Sets Operations (Union, Intersection, Difference) ---');
  Set<String> groupA = {'Dart', 'Flutter', 'Git', 'SQL'};
  Set<String> groupB = {'Python', 'Git', 'SQL', 'Docker'};

  print('Union (всі технології): ${groupA.union(groupB)}');
  print('Intersection (спільні): ${groupA.intersection(groupB)}');
  print('Difference (тільки в A): ${groupA.difference(groupB)}');
}

void demonstrateMaps() {
  print('\n--- Maps Operations ---');
  String text = 'Dart is fast and Dart is easy to learn for mobile apps';
  print('Word frequencies: ${DataProcessor.countWords(text)}');
}

void demonstrateAdvancedOperations() {
  print('\n--- University & CSV Data Analysis ---');
  String csvData = '''
id,firstName,lastName,birthYear,course,grade
S01,Yevhen,Samoilenko,2004,CS101,95
S02,Anna,Melnyk,2005,CS101,88
S03,Maksym,Koval,2004,CS101,76
''';

  final uni = University(name: 'KPI');
  uni.courses.add(Course(
    id: 'CS101',
    name: 'Dart Programming',
    description: 'Core Dart',
    credits: 5,
    instructor: 'Dr. Kovalenko',
  ));

  final lines = csvData.trim().split('\n').skip(1);
  for (var line in lines) {
    final parts = line.split(',');
    final student = Student(
      id: parts[0],
      firstName: parts[1],
      lastName: parts[2],
      birthDate: DateTime(int.parse(parts[3]), 1, 1),
    );
    student.addGrade(parts[4], double.parse(parts[5]));
    if (student.id == 'S01') student.addGrade('CS202', 91);
    uni.addStudent(student);
  }

  print('Sorted by GPA: ${DataProcessor.sortStudentsByGPA(uni.students)}');
  print('Unique courses: ${DataProcessor.getUniqueCourses(uni.students)}');
  print('Common courses: ${DataProcessor.findCommonCourses(uni.students)}');
  print('Avg grades by course: ${DataProcessor.calculateAverageGradesByCourse(uni.students)}');
  print('University Report: ${DataProcessor.generateReport(uni)}');
}