sealed class ForgetPasswordState {}

class InitialForgetPasswordState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccessState(this.message);
}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;

  ForgetPasswordErrorState(this.message);
}

class ForgetPasswordLoadingState extends ForgetPasswordState {}
