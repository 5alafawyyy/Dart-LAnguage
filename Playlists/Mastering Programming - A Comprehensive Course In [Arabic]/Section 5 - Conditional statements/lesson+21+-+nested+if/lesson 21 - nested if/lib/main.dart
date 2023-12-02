void main() {
  bool isAdmin = false;
  bool isModerator = true;
  bool isGroupExpert = true;
  if (isAdmin) {
    print('you have admin privilges');
  } else if (isModerator) {
    print('you have moderator privilges');
  } else if (isGroupExpert) {
    print('you have groub bexpert privilges');
  } else {
    print('you have user privilges');
  }

  print('continue');
  // admin , moderators , users
}
