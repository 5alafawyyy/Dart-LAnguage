DateTime addGigasecondTo(final DateTime dateTime) {
  int gigasecond = 1000000000;

  return dateTime.add(Duration(seconds: gigasecond));
}
