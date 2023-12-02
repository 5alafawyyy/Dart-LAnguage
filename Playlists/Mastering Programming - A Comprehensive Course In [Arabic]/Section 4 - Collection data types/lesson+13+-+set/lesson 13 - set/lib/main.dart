void main() {
  Set<String> favColors = {'black', 'white', 'black'};
  List<String> favColors2 = ['black', 'white', 'black'];

  favColors.remove('black');
  favColors2.remove('black');

  print(favColors);
  print(favColors2);
}
