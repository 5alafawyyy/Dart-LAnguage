// Another Solution

int score(String word) {
  Map<String, int> letterScores = {
    'AEIOULNRST': 1,
    'DG': 2,
    'BCMP': 3,
    'FHVWY': 4,
    'K': 5,
    'JX': 8,
    'QZ': 10,
  };

  int result = 0;

  for (int i = 0; i < word.length; i++) {
    String letter = word[i].toUpperCase();

    for (var entry in letterScores.entries) {
      if (entry.key.contains(letter)) {
        result += entry.value;
        break;
      }
    }
  }

  return result;
}


