class Forth {
  List<int> stack = []; // Stack to hold integers
  Map<String, List<String>> definitions =
      {}; // Dictionary to store user-defined words

  // Evaluate a given Forth code
  void evaluate(String input) {
    List<String> tokens = _tokenize(input);
    for (var token in tokens) {
      _execute(token);
    }
  }

  // Tokenize the input string based on spaces
  List<String> _tokenize(String input) {
    return input.split(RegExp(r'\s+'));
  }

  // Execute a token from the input
  void _execute(String token) {
    if (_isNumber(token)) {
      stack.add(int.parse(token)); // If it's a number, push to the stack
    } else if (definitions.containsKey(token.toUpperCase())) {
      // If it's a defined word, execute its definition
      for (var defToken in definitions[token.toUpperCase()]!) {
        _execute(defToken);
      }
    } else {
      _handleWord(token); // Handle built-in operations
    }
  }

  // Handle built-in Forth operations
  void _handleWord(String word) {
    switch (word.toUpperCase()) {
      case '+':
        _binaryOperation((a, b) => b + a);
        break;
      case '-':
        _binaryOperation((a, b) => b - a);
        break;
      case '*':
        _binaryOperation((a, b) => b * a);
        break;
      case '/':
        _binaryOperation((a, b) {
          if (a == 0) throw Exception('Division by zero');
          return b ~/ a;
        });
        break;
      case 'DUP':
        _duplicate();
        break;
      case 'DROP':
        _drop();
        break;
      case 'SWAP':
        _swap();
        break;
      case 'OVER':
        _over();
        break;
      default:
        throw Exception('Unknown command: $word');
    }
  }

  // Perform a binary operation on the top two elements of the stack
  void _binaryOperation(int Function(int, int) operation) {
    if (stack.length < 2) {
      throw Exception('Stack doesn\'t have enough elements');
    }
    int a = stack.removeLast();
    int b = stack.removeLast();
    stack.add(operation(a, b));
  }

  // Duplicate the top element of the stack
  void _duplicate() {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }
    stack.add(stack.last);
  }

  // Remove the top element from the stack
  void _drop() {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }
    stack.removeLast();
  }

  // Swap the positions of the top two elements on the stack
  void _swap() {
    if (stack.length < 2) {
      throw Exception('Stack doesn\'t have enough elements');
    }
    int temp = stack[stack.length - 2];
    stack[stack.length - 2] = stack.last;
    stack[stack.length - 1] = temp;
  }

  // Copy the second element from the top of the stack
  void _over() {
    if (stack.length < 2) {
      throw Exception('Stack doesn\'t have enough elements');
    }
    stack.add(stack[stack.length - 2]);
  }

  // Define a new Forth word
  void define(String name, String definition) {
    definitions[name.toUpperCase()] = _tokenize(definition);
  }

  // Check if a token is a number
  bool _isNumber(String token) {
    return int.tryParse(token) != null;
  }
}
