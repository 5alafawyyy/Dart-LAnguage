import 'dart:math';

BigInt square(final int n) {
  if (n < 1 || n > 64) {
    throw ArgumentError('square must be between 1 and 64');
  } else {
    BigInt sum = BigInt.from(0);

    for (int i = 1; i <= n; i++) {
      sum = BigInt.from(pow(2, i - 1).toInt());
    }
    return sum;
  }
}

BigInt total() {
  BigInt total = BigInt.from(0);
  for (int i = 1; i <= 64; i++) {
    print(BigInt.from(pow(2, i - 1).toInt()));
    total += BigInt.from(pow(2, i - 1).toInt());
  }
  return total;
}

