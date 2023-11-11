class Leap {
  bool leapYear(int year) {
    bool isLeap = false;

    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          isLeap = false;
        } else {
          isLeap = true;
        }
      } else {
        isLeap = true;
      }
    } else {
      isLeap = false;
    }
    return isLeap;
  }
}
