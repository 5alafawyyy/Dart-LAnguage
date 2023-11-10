String twoFer([String name = '']) {
  String output = '';

  if (name == 'you' || name.isEmpty) {
    output = 'One for you, one for me.';
  } else {
    output = 'One for ${name}, one for me.';
  }

  return output;
}
