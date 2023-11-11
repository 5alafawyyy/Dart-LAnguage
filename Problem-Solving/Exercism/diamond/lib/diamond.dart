class Diamond {
  // Method to generate rows for the diamond
  List<String> rows(String letter) {
    final int diamondSize =
        letter.toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0) + 1;
    final List<String> result = [];

    // Generate the top half of the diamond
    for (int i = 0; i < diamondSize; i++) {
      result.add(_generateRow(i, diamondSize));
    }

    // Generate the bottom half of the diamond
    for (int i = diamondSize - 2; i >= 0; i--) {
      result.add(_generateRow(i, diamondSize));
    }

    return result;
  }

  // Helper method to generate a single row of the diamond
  String _generateRow(int rowNumber, int diamondSize) {
    final String currentLetter =
        String.fromCharCode('A'.codeUnitAt(0) + rowNumber);
    if (rowNumber == 0) {
      // First row with only one letter
      return ' . ' * (diamondSize - 1) +
          currentLetter +
          ' . ' * (diamondSize - 1);
    } else {
      // Rows with two identical letters
      final String spaces = ' . ' * (diamondSize - rowNumber - 1);
      return spaces +
          currentLetter +
          ' . ' * (2 * rowNumber - 1) +
          currentLetter +
          spaces;
    }
  }
}
