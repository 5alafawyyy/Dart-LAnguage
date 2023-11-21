class Bob {
  // Put your code here
  late String result;
  String response(String phrase) {
    switch (phrase) {
      case r"\?":
        result = "Sure";

        break;
      case r"[A-Z]":
        result = "Whoa, chill out!";
        break;
      case r"[A-Z\?]":
        result = "Calm down, I know what I'm doing!";
        break;
      case r'^\s*$':
        result = "Fine. Be that way!";
        break;
      default:
        result = "Whatever.";
    }
    return result;
  }
}

void main() {
  print(Bob().response('Tom-ay-to, tom-aaaah-to.'));
}
