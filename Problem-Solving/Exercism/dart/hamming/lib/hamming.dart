class Hamming {
  int distance(String s, String t) {
    List<String> s1 = s.split("").toList();
    List<String> s2 = t.split("").toList();
    int distanceCount = 0;

    if (s1.length != s2.length) {
      throw ('strands must be of equal length');
    } else {
      for (int i = 0; i < s1.length; i++) {
        if (s1[i] != s2[i]) {
          distanceCount++;
        }
      }
      return distanceCount;
    }
  }
}
