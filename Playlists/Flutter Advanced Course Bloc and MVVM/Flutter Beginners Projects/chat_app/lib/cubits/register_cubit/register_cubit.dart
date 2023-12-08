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

  Future<void> signOut() async {
    final result =  FirebaseAuth.instance.currentUser;
    print(result);
    await FirebaseAuth.instance.signOut();
 
  }

  Future<void> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
     print(e.toString());

      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
      } else {
        // Handle other Firebase exceptions
      }
    } catch (e) {
     print(e.toString());

      // Handle general exception
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData = FirebaseAuth.instance.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      // Handle exceptions
    }
  }
}
