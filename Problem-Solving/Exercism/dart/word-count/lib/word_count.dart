class WordCount {
  // Put your code here

  Map<String, int> countWords(String subtitle) {
    Map<String, int> wordCounts = {};

    List<String> words =
        subtitle.toLowerCase().split(RegExp(r"[^a-zA-Z0-9']+"));

    for (String word in words) {
      // Remove leading and trailing apostrophes
      word = word.replaceAll(RegExp(r"^'+|'+$"), '');

      // Update word count in the map
      wordCounts[word] = (wordCounts[word] ?? 0) + 1;
    }

    return wordCounts;
  }
}

