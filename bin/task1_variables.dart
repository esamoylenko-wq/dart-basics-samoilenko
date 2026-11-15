void main() {
  print('=== Dart Variables & Types Demo ===');
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  print('\n--- Numbers (int, double, num) ---');
  int studentsCount = 25;
  double averageScore = 88.5;
  num flexibleNumber = 10;
  flexibleNumber = 10.75;

  int totalPoints = studentsCount * 4;
  double division = totalPoints / 3;
  int integerDivision = totalPoints ~/ 3;
  int remainder = totalPoints % 3;

  print('Students: $studentsCount, Average: $averageScore, Flexible: $flexibleNumber');
  print('Total: $totalPoints, Div: ${division.toStringAsFixed(2)}, IntDiv: $integerDivision, Mod: $remainder');

  String numberText = '42';
  int parsedInt = int.parse(numberText);
  double convertedDouble = parsedInt.toDouble();
  String backToString = averageScore.toString();
  print('Parsed: $parsedInt, ToDouble: $convertedDouble, BackToString: "$backToString"');
}

void demonstrateStrings() {
  print('\n--- Strings ---');
  String firstName = 'Yevhen';
  String lastName = 'Samoilenko';

  String fullName = '$firstName $lastName';
  print('Full name: $fullName (length: ${fullName.length})');

  String multiLine = '''
University: KPI
Faculty: Informatics
Quote: "Dart is awesome!\nLet's code."''';
  print(multiLine);

  print('Uppercase: ${fullName.toUpperCase()}');
  print('Contains "Yevhen": ${fullName.contains('Yevhen')}');
  print('Replaced: ${fullName.replaceAll('Yevhen', 'Student Yevhen')}');
}

void demonstrateBooleans() {
  print('\n--- Booleans & Logic ---');
  int score = 85;
  bool isPassed = score >= 60;
  bool hasBonus = true;

  bool getsScholarship = isPassed && hasBonus && (score > 80);
  print('Passed: $isPassed, Scholarship: $getsScholarship');

  String status = isPassed ? 'Екзамен складено' : 'Перездача';
  print('Status: $status');
}

void demonstrateCollections() {
  print('\n--- Collections (List, Set, Map) ---');
  // List — список по порядку (можуть бути дублікати)
  List<String> subjects = ['Math', 'Dart', 'Databases'];
  subjects.add('Algorithms');
  print('List: $subjects, first: ${subjects.first}');

  // Set — множина тільки унікальних значень
  Set<int> uniqueCodes = {101, 102, 101, 103}; // дублікат 101 ігнорується
  uniqueCodes.add(104);
  print('Set (unique): $uniqueCodes');

  // Map — словник "ключ: значення"
  Map<String, int> studentGrades = {
    'Math': 90,
    'Dart': 98,
  };
  studentGrades['Databases'] = 85;
  print('Map: $studentGrades, Dart grade: ${studentGrades['Dart']}');
}

void demonstrateNullSafety() {
  print('\n--- Null Safety ---');
  // Знак ? дозволяє змінній бути порожньою (null)
  String? middleName;
  // Оператор ?? підставляє запасне значення, якщо зліва null
  print('Middle name: ${middleName ?? 'Не вказано'}');

  // Оператор ??= записує значення тільки якщо змінна зараз null
  middleName ??= 'Олександрович';
  print('After ??=: $middleName');

  // Оператор ?. безпечно викликає метод без помилки, якщо там null
  String? nullableText;
  print('Safe length: ${nullableText?.length}');

  // late — обіцяємо заповнити змінну пізніше, перед використанням
  late String universityName;
  universityName = 'National Technical University';
  print('Late variable: $universityName');

  printGreeting(name: 'Yevhen');
}

void printGreeting({required String name, String? title}) {
  print('Hello, ${title ?? ''} $name!'.trim());
}
