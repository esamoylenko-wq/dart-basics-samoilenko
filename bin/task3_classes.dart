import 'package:dart_basics_samoilenko/models/student.dart';
import 'package:dart_basics_samoilenko/models/course.dart';
import 'package:dart_basics_samoilenko/models/university.dart';

void main() {
  print('=== University Management System Demo ===');
  runUniversityDemo();
}

void runUniversityDemo() {
  // 1. Створюємо університет
  final uni = University(name: 'KPI Technical University');

  // 2. Створюємо і додаємо професора
  final prof = Professor(
    id: 'P01',
    firstName: 'Oksana',
    lastName: 'Kovalenko',
    birthDate: DateTime(1980, 5, 14),
    department: 'Software Engineering',
    salary: 35000,
  );
  prof.assignCourse('CS101');
  prof.assignCourse('CS202');
  uni.professors.add(prof);

  // 3. Створюємо курси (CS202 вимагає попереднього складання CS101)
  final courseIntro = Course(
    id: 'CS101',
    name: 'Introduction to Programming',
    description: 'Basic algorithms and syntax',
    credits: 4,
    instructor: prof.fullName,
  );
  final courseMobile = Course(
    id: 'CS202',
    name: 'Mobile Development with Dart',
    description: 'Cross-platform apps',
    credits: 5,
    instructor: prof.fullName,
    prerequisites: ['CS101'],
  );
  uni.courses.addAll([courseIntro, courseMobile]);

  // 4. Створюємо студентів
  final student1 = Student(
    id: 'S01',
    firstName: 'Yevhen',
    lastName: 'Samoilenko',
    birthDate: DateTime(2004, 8, 22),
  );
  final student2 = Student(
    id: 'S02',
    firstName: 'Anna',
    lastName: 'Melnyk',
    birthDate: DateTime(2005, 3, 10),
  );

  uni.addStudent(student1);
  uni.addStudent(student2);

  // 5. Записуємо на курси та ставимо оцінки
  student1.enrollInCourse('CS101');
  student1.addGrade('CS101', 92.0); // склав CS101, тому CS202 для нього відкритий

  student2.enrollInCourse('CS101');
  student2.addGrade('CS101', 54.0); // не склав (< 60), тому CS202 недоступний

  print('\n--- People in University ---');
  print('${prof.role}: $prof');
  print('Student 1: $student1');
  print('Student 2: $student2');

  print('\n--- Available Courses Check ---');
  print('Available for ${student1.fullName}: ${uni.getAvailableCoursesForStudent('S01')}');
  print('Available for ${student2.fullName}: ${uni.getAvailableCoursesForStudent('S02')}');

  // Записуємо student1 на CS202
  if (courseMobile.canStudentEnroll(student1)) {
    student1.enrollInCourse('CS202');
    student1.addGrade('CS202', 96.0);
  }

  print('\n--- Students enrolled in CS101 ---');
  print(uni.getStudentsByCourse('CS101'));

  // 6. Статистика університету
  print('\n--- University Statistics ---');
  print(uni.generateStatistics());
}
