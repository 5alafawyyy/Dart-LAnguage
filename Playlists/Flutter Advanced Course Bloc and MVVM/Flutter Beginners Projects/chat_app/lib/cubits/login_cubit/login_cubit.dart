import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccessState(UserModel.fromFirebaseUser(credential.user!)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginErrorState('The password provided is too weak.'));
      } else if (e.code == 'user-not-found') {
        emit(LoginErrorState('No user found for this email.'));
      }else if (e.code == 'wrong-password') {
        emit(LoginErrorState('Wrong user privded for that user'));
      }else {
        emit(LoginErrorState(e.code.toString()));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
