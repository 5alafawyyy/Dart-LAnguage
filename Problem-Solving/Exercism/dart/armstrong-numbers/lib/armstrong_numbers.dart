import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    List<int> digits = number.split('').map(int.parse).toList();

    int result = digits.fold(
        0, (sum, digit) => sum + powerOfNumber(digit, digits.length));

    return result == int.parse(number);
  }

  int powerOfNumber(int base, int exponent) {
    return pow(base, exponent).toInt();
  }
}
