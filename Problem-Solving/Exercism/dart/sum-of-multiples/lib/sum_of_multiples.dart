class SumOfMultiples {
  int sum(List<int> multiples, int max) {
    Set<int> multiplesSet = {};

    for (int multiple in multiples) {
      for (int i = 1; multiple * i < max; i++) {
        multiplesSet.add(multiple * i);
      }
    }

    return multiplesSet.fold(0, (acc, curr) => acc + curr);
  }
}
