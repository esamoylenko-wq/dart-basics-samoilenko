import 'package:dart_basics_samoilenko/utils/calculator.dart';

void main() {
  print('=== Dart Functions Demo ===');
  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
  runCalculatorAndTextAnalyzer();
}

int calculateSum(int a, int b) {
  return a + b;
}

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0.0;
  double sum = numbers.reduce((a, b) => a + b);
  return sum / numbers.length;
}

String formatName(
  String firstName,
  String lastName, {
  String? middleName,
  bool uppercase = false,
}) {
  String result = middleName != null
      ? '$firstName $middleName $lastName'
      : '$firstName $lastName';
  return uppercase ? result.toUpperCase() : result;
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

void testBasicFunctions() {
  print('\n--- Basic Functions ---');
  print('Sum (15 + 27): ${calculateSum(15, 27)}');
  print('Average ([85, 90, 95]): ${calculateAverage([85.0, 90.0, 95.0])}');
}

void testAdvancedFunctions() {
  print('\n--- Named Parameters & Recursion ---');
  print('Formatted 1: ${formatName('Yevhen', 'Samoilenko')}');
  print('Formatted 2: ${formatName('Yevhen', 'Samoilenko', middleName: 'O.', uppercase: true)}');
  print('Fibonacci(7): ${fibonacci(7)}');
  print('Factorial(5): ${factorial(5)}');
}

void testFunctionalProgramming() {
  print('\n--- Functional Programming & Closures ---');
  List<int> grades = [55, 72, 88, 95, 61, 49];

  var passedGrades = grades.where((g) => g >= 60).toList();
  var bonusGrades = passedGrades.map((g) => g + 5).toList();
  int totalScore = passedGrades.fold(0, (sum, g) => sum + g);

  print('Passed grades: $passedGrades');
  print('With +5 bonus: $bonusGrades');
  print('Total passed score: $totalScore');

  Function makeMultiplier(int multiplier) {
    return (int value) => value * multiplier;
  }

  var triple = makeMultiplier(3);
  print('Closure triple(10): ${triple(10)}');
}

void runCalculatorAndTextAnalyzer() {
  print('\n--- Calculator & Text Analyzer ---');
  final calc = Calculator();
  print('Calc 12 + 8 = ${calc.add(12, 8)}');
  print('Calc 2 ^ 10 = ${calc.power(2, 10)}');
  print('Calc sqrt(144) = ${calc.squareRoot(144)}');

  String sampleText = 'Dart is fast, modern, and great for mobile development.';
  int charCount = sampleText.length;
  int charNoSpaces = sampleText.replaceAll(' ', '').length;
  int wordCount = sampleText.trim().split(RegExp(r'\s+')).length;

  print('Text: "$sampleText"');
  print('Words: $wordCount, Total chars: $charCount, Chars without spaces: $charNoSpaces');
}
