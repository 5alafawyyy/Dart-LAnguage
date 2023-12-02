void main() {
  int mathScore = 70;
  int englishScore = 40;
  int arabicScore = 70;

  bool hasHePassed = mathScore >= 50 && englishScore >= 50 && arabicScore >= 50;
  if (hasHePassed) {
    print('congratulations you passed');
  }

  // website groubs [admin , moderators]

  bool isAdmin = true;
  bool isModerator = true;

  if (isAdmin || isModerator) {
    print('you have admin or moderator privilges');
  }
}
