import 'dart:math';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Помилка: ділення на нуль неможливе!');
    }
    return a / b;
  }

  double power(double base, double exponent) => pow(base, exponent).toDouble();

  double squareRoot(double value) {
    if (value < 0) {
      throw ArgumentError('Помилка: корінь з від’ємного числа!');
    }
    return sqrt(value);
  }
}
