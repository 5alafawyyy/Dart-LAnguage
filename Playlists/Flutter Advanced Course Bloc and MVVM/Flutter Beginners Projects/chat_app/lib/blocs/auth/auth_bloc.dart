import 'dart:async';

import 'package:chat_app/helper/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription<User?> _authSubscription;

  AuthBloc() : super(AuthInitialState()) {
    on<AuthStateChangedEvent>(_onAuthStateChangedEvent);
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);

    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // User is signed in
        add(AuthStateChangedEvent(user));
      } else {
        // User is signed out
        add(AuthStateChangedEvent(null));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginLoadingState());
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      CacheHelper.put(key: 'uid', value: credential.user!.uid);
      emit(LoginSuccessState(UserModel.fromFirebaseUser(credential.user!)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginErrorState('The password provided is too weak.'));
      } else if (e.code == 'user-not-found') {
        emit(LoginErrorState('No user found for this email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState('Wrong user privded for that user'));
      } else {
        emit(LoginErrorState(e.code.toString()));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  FutureOr<void> _onAuthStateChangedEvent(
      AuthStateChangedEvent event, Emitter<AuthState> emit) {
    event.user != null
        ? emit(UserAuthenticatedState(user: event.user!))
        : emit(UserUnauthenticatedState());
  }
}

FutureOr<void> _onRegisterEvent(
    RegisterEvent event, Emitter<AuthState> emit) async {
  try {
    emit(RegisterLoadingState());
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    CacheHelper.put(key: 'uid', value: credential.user!.uid);

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
