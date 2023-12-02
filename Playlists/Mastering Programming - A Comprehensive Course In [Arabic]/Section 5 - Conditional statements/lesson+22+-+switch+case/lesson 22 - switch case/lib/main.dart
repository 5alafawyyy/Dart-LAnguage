void main() {
  String grade = 'F';
  // if (grade == 'A') {
  //   print('Your grade is excellent');
  // } else if (grade == 'B') {
  //   print('Your grade is to a good');
  // } else if (grade == 'C') {
  //   print('Your grade is to a fair');
  // } else if (grade == 'D') {
  //   print('Your grade is to a poor');
  // } else if (grade == 'F') {
  //   print('Your grade is to a fail');
  // } else {
  //   print('Invalid grade!');
  // }
  // ==
  switch (grade) {
    case 'A':
      print('Your grade is excellent');
      break;

    case 'B':
      print('Your grade is good');
      break;

    case 'C':
      print('Your grade is fair');
      break;

    case 'D':
      print('Your grade is poor');
      break;

    case 'F':
      print('Your grade is fail');
      break;

    default:
      print('Invalid grade!');
  }
}
