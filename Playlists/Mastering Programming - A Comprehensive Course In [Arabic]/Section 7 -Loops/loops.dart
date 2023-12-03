void main() {
  // WHILE LOOP
  // Executes a block of code repeatedly while a condition is true
  int i = 0;
  while (i < 5) {
    print('While loop: $i');
    i++;
  }
  print('--------------------');

  // DO-WHILE LOOP
  // Similar to the while loop, but it always executes the block of code at least once
  int j = 0;
  do {
    print('Do-While loop: $j');
    j++;
  } while (j < 5);
  print('--------------------');

  // FOR LOOP
  // Executes a block of code a specified number of times
  for (int k = 0; k < 5; k++) {
    print('For loop: $k');
  }
  print('--------------------');

  // FOR-EACH LOOP
  // Iterates over elements in an iterable collection (lists, sets, maps, etc.)
  List<int> numbers = [0, 1, 2, 3, 4];
  for (int number in numbers) {
    print('For-Each loop: $number');
  }

  numbers.forEach((element) {
    print('For-Each loop 1: $element');
  });
  print('--------------------');

  // BREAK AND CONTINUE
  // Control statements used to exit a loop prematurely (break) or skip an iteration (continue)
  for (int m = 0; m < 5; m++) {
    if (m == 2) {
      continue; // Skip iteration when m is 2
    }
    if (m == 4) {
      break; // Exit loop when m is 4
    }
    print('Loop with break and continue: $m');
  }
}
