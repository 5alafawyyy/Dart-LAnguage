// ignore_for_file: equal_elements_in_set
// ignore_for_file: unused_local_variable
void main() {
  Set<String> favColors = {'black', 'white', 'black'};
  List<String> favColors2 = ['black', 'white', 'black'];

  favColors.remove('black');
  favColors2.remove('black');

  print(favColors);
  print(favColors2);
}

