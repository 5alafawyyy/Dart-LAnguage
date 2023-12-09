part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel userModel;

  LoginSuccessState(this.userModel);
}

class LoginErrorState extends AuthState {
  final String error;

  LoginErrorState(this.error);
}

class RegisterInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserModel userModel;

  RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends AuthState {
  final String error;

  RegisterErrorState(this.error);
}

class UserAuthenticatedState extends AuthState {
  final User user;

  UserAuthenticatedState({required this.user});
}

class UserUnauthenticatedState extends AuthState {}
