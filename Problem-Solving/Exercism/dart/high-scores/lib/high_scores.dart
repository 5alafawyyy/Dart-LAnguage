class HighScores {
  List<int> scores;

  HighScores(this.scores);

  int latest() {
    return scores.last;
  }

  int personalBest() {
    return scores.fold(
        scores[0],
        (previousValue, element) =>
            (previousValue > element) ? previousValue : element);
  }

  List<int> personalTopThree() {
    List<int> copyOfData = [...scores];
    List<int> topThreeResult = [];

    for (int i = 0; i < 3; i++) {
      topThreeResult.add(copyOfData.fold(
          copyOfData[0],
          (previousValue, element) =>
              (previousValue > element) ? previousValue : element));

      copyOfData.remove(topThreeResult[i]);
    }
    return topThreeResult;
  }
}
