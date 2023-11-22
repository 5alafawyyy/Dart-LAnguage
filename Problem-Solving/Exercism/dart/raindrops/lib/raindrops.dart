class Raindrops {
  String convert(int i) {
    String result = '';
    if (i % 3 == 0) {
      result += 'Pling';
    }
    if (i % 5 == 0) {
      result += 'Plang';
    }
    if (i % 7 == 0) {
      result += 'Plong';
    } else {
      result = '$i';
    }

    return result.isNotEmpty ? result : i.toString();
  }
}
