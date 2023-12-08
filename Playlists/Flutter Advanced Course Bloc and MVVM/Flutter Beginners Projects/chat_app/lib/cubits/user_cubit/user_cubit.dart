import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

// States
abstract class UserState {}

class UserLoggedIn extends UserState {
  final User user;

  UserLoggedIn(this.user);
}

class UserLoggedOut extends UserState {}

class UserError extends UserState {
  final String error;

  UserError(this.error);
}

// Events
abstract class UserEvent {}

class CheckUserLoggedIn extends UserEvent {}

class SignOutUser extends UserEvent {}

class SignInUser extends UserEvent {
  final String email;
  final String password;

  SignInUser(this.email, this.password);
}

// Cubit
class UserCubit extends Cubit<UserState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserCubit() : super(UserLoggedOut());

  void checkUserLoggedIn() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        emit(UserLoggedIn(user));
      } else {
        emit(UserLoggedOut());
      }
    } catch (e) {
      emit(UserError('Error checking user login status'));
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      emit(UserLoggedOut());
    } catch (e) {
      emit(UserError('Error signing out'));
    }
  }

}
