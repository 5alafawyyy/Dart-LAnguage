class PrimeFactors {
  List<int> factors(int number) {
    List<int> result = [];

    int divisor = 2;

    // Test the number 1 at first
    if (number == 1) {
      result = [1];
    }

    while (number > 1) {
      while (number % divisor == 0) {
        result.add(divisor);
        number = number ~/ divisor; // Integer division to reduce the number
      }

      // Move on to the next divisor
      divisor++;
    }

    return result;
  }
}
