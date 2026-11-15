void main() {
  print('=== Dart Variables & Types Demo ===');
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
}

void demonstrateNumbers() {
  print('\n--- Numbers (int, double, num) ---');
  int studentsCount = 25; // ціле число
  double averageScore = 88.5; // дробове число
  num flexibleNumber = 10; // num може бути і int, і double
  flexibleNumber = 10.75;

  // Математичні операції
  int totalPoints = studentsCount * 4;
  double division = totalPoints / 3;
  int integerDivision = totalPoints ~/ 3; // ділення націло
  int remainder = totalPoints % 3; // остача від ділення

  print('Students: $studentsCount, Average: $averageScore, Flexible: $flexibleNumber');
  print('Total: $totalPoints, Div: ${division.toStringAsFixed(2)}, IntDiv: $integerDivision, Mod: $remainder');

  // Перетворення типів (Type conversion)
  String numberText = '42';
  int parsedInt = int.parse(numberText);
  double convertedDouble = parsedInt.toDouble();
  String backToString = averageScore.toString();
  print('Parsed: $parsedInt, ToDouble: $convertedDouble, BackToString: "$backToString"');
}

void demonstrateStrings() {
  print('\n--- Strings ---');
  String firstName = 'Olena';
  String lastName = 'Samoilenko';

  // Інтерполяція (вставка змінних у текст через $)
  String fullName = '$firstName $lastName';
  print('Full name: $fullName (length: ${fullName.length})');

  // Багаторядковий текст (Multi-line strings) та escape-послідовності
  String multiLine = '''
University: KPI
Faculty: Informatics
Quote: "Dart is awesome!\nLet's code."''';
  print(multiLine);

  // Методи роботи з рядками
  print('Uppercase: ${fullName.toUpperCase()}');
  print('Contains "Olena": ${fullName.contains('Olena')}');
  print('Replaced: ${fullName.replaceAll('Olena', 'Student Olena')}');
}

void demonstrateBooleans() {
  print('\n--- Booleans & Logic ---');
  int score = 85;
  bool isPassed = score >= 60;
  bool hasBonus = true;

  // Логічні оператори (&& - І, || - АБО, ! - НЕ)
  bool getsScholarship = isPassed && hasBonus && (score > 80);
  print('Passed: $isPassed, Scholarship: $getsScholarship');

  // Тернарний оператор (умовний вираз: умова ? якщо_так : якщо_ні)
  String status = isPassed ? 'Екзамен складено' : 'Перездача';
  print('Status: $status');
}