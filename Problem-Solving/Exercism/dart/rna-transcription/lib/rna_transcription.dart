class RnaTranscription {
  String toRna(String s) {
    Map<String, String> map = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    };
    String result = '';
    for (String item in s.split('').toList()) {
      result += map[item] ?? '';
    }
    return result;
  }
}
