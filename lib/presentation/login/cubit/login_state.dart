class LoginState {}

class LoginInitialState extends LoginState {}

class LoginChangeSuffixIconState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  String message;

  LoginErrorState(this.message);
}
