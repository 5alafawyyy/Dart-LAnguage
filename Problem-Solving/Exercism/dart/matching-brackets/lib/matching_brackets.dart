class MatchingBrackets {
  bool isPaired(String input) {
    final Map<String, String> bracketPairs = {
      '}': '{',
      ']': '[',
      ')': '(',
    };

    final List<String> stack = [];

    for (int i = 0; i < input.length; i++) {
      String currentBracket = input[i];

      if (bracketPairs.containsKey(currentBracket)) {
        String topElement = stack.isEmpty ? '#' : stack.removeLast();
        if (topElement != bracketPairs[currentBracket]) {
          return false;
        }
      } else {
        stack.add(currentBracket);
      }
    }
    return stack.isEmpty;
  }
}
