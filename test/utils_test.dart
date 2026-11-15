import 'package:test/test.dart';
import 'package:dart_basics_samoilenko/utils/calculator.dart';
import 'package:dart_basics_samoilenko/utils/data_processor.dart';
import 'package:dart_basics_samoilenko/models/student.dart';

void main() {
  group('Calculator Tests', () {
    final calc = Calculator();

    test('Basic arithmetic operations', () {
      expect(calc.add(10, 5), equals(15));
      expect(calc.subtract(10, 5), equals(5));
      expect(calc.multiply(4, 3), equals(12));
      expect(calc.divide(10, 2), equals(5));
    });

    test('Division by zero throws ArgumentError', () {
      expect(() => calc.divide(10, 0), throwsArgumentError);
    });
  });

  group('DataProcessor Tests', () {
    test('Filter even numbers and count words', () {
      expect(DataProcessor.filterEvenNumbers([1, 2, 3, 4, 5, 6]), equals([2, 4, 6]));
      final counts = DataProcessor.countWords('Dart is great, dart is fast');
      expect(counts['dart'], equals(2));
      expect(counts['is'], equals(2));
    });

    test('Sort students by GPA', () {
      final s1 = Student(
        id: 'S01',
        firstName: 'A',
        lastName: 'B',
        birthDate: DateTime(2004, 1, 1),
        grades: {'CS101': 70},
      );
      final s2 = Student(
        id: 'S02',
        firstName: 'C',
        lastName: 'D',
        birthDate: DateTime(2004, 1, 1),
        grades: {'CS101': 95},
      );

      final sorted = DataProcessor.sortStudentsByGPA([s1, s2]);
      expect(sorted.first['id'], equals('S02'));
    });
  });
}