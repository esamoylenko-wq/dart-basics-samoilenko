import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_basics_samoilenko/models/student.dart';

Future<void> main() async {
  print('=== Dart Async Programming & File I/O Demo ===');
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

// Симуляція асинхронного завантаження даних (API)
Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(milliseconds: 500));
  if (studentId == 'INVALID') {
    throw Exception('Студента з ID "$studentId" не знайдено!');
  }
  return 'Дані завантажено для студента ID: $studentId';
}

Future<void> demonstrateFutures() async {
  print('\n--- Futures, async/await & Future.wait ---');

  // Послідовний виклик + обробка помилок (try/catch)
  try {
    final data = await fetchStudentData('S01');
    print('Single fetch: $data');
    await fetchStudentData('INVALID');
  } catch (e) {
    print('Caught expected error: $e');
  }

  // Паралельне виконання кількох запитів через Future.wait
  final stopwatch = Stopwatch()..start();
  final results = await Future.wait([
    fetchStudentData('S01'),
    fetchStudentData('S02'),
    fetchStudentData('S03'),
  ]);
  stopwatch.stop();
  print('Parallel Future.wait (${results.length} items) finished in ${stopwatch.elapsedMilliseconds}ms');
}

// Генератор потоку даних (Stream)
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    yield i;
  }
}

Future<void> demonstrateStreams() async {
  print('\n--- Streams Demo ---');
  final transformedStream = countStream(5)
      .where((n) => n % 2 != 0)
      .map((n) => 'Tick #$n (squared: ${n * n})');

  await for (final event in transformedStream) {
    print('Stream event -> $event');
  }
}

// Робота з файлами та JSON (dart:io + dart:convert)
Future<void> demonstrateFileOperations() async {
  print('\n--- File I/O & JSON Serialization ---');
  final students = [
    Student(
      id: 'S01',
      firstName: 'Yevhen',
      lastName: 'Samoilenko',
      birthDate: DateTime(2004, 8, 22),
      grades: {'CS101': 95.0, 'CS202': 91.0},
    ),
    Student(
      id: 'S02',
      firstName: 'Anna',
      lastName: 'Melnyk',
      birthDate: DateTime(2005, 3, 10),
      grades: {'CS101': 88.0},
    ),
  ];

  final file = File('students_export.json');

  // Збереження списку студентів у JSON-файл
  final jsonString = jsonEncode(students.map((s) => s.toJson()).toList());
  await file.writeAsString(jsonString);
  print('Saved ${students.length} students to ${file.path}');

  // Читання та відновлення об'єктів з файлу
  if (await file.exists()) {
    final content = await file.readAsString();
    final List<dynamic> decoded = jsonDecode(content);
    final loadedStudents = decoded.map((item) => Student.fromJson(item)).toList();
    print('Loaded from JSON: $loadedStudents');

    // Видаляємо тимчасовий файл після перевірки, щоб не засмічувати репозиторій
    await file.delete();
  }
}