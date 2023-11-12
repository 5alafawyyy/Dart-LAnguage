class DifferenceOfSquares {
  int squareOfSum(int n) {
    int _sum = 0;
    for (int i = 1; i <= n; i++) {
      _sum += i;
    }
    return (_sum * _sum);
  }

  int sumOfSquares(int n) {
    int _sumOfSquaresResult = 0;
    for (int i = 1; i <= n; i++) {
      _sumOfSquaresResult += (i * i);
    }
    return _sumOfSquaresResult;
  }

  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}

/* ============== Another Sol ==================*/
/**
 class DifferenceOfSquares {
  int squareOfSum(int n) {
    final sum = Iterable.generate(n).fold(0, (acc, i) => (acc + i + 1).toInt());
    return sum * sum;
  }

  int sumOfSquares(int n) {
    return Iterable.generate(n)
        .map((i) => (i + 1) * (i + 1))
        .fold(0, (acc, val) => (acc + val).toInt());
  }

  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
 */