import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      emit(RegisterLoadingState());
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(RegisterSuccessState(UserModel.fromFirebaseUser(credential.user!)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        emit(RegisterErrorState('The password provided is wrong.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState('email already exists'));
      } else {
        emit(RegisterErrorState(e.code.toString()));
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}
