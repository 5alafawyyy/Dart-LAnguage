void main() {
  // main function scope
  int age = 15;

  if (true) {
    print(age);
  }
  print(age);
  if (true) {
    // if scope
    print(age);
  }
  print(age);
}
