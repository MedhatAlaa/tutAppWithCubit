import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/domain/usecase/login_usecase.dart';
import 'package:new_tut_app/presentation/login/cubit/login_state.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';

import '../../resources/rouets_manger.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  final LoginUseCase _loginUseCase;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = false;
  IconData suffixIcon = Icons.visibility_off_rounded;
  Color iconColor = ColorManger.grey;

  void changeSuffixIcon() {
    isPassword = !isPassword;
    iconColor = isPassword ? ColorManger.primary : ColorManger.grey;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off_rounded;
    emit(LoginChangeSuffixIconState());
  }

  void login() async {
    emit(LoginLoadingState());
    final result = await _loginUseCase.execute(
        LoginUseCaseInput(emailController.text, passwordController.text));

    result.fold((failure) {
      emit(LoginErrorState(failure.message));
    }, (data) {
      print(data.customer!.name);
      print(data.contacts!.phone);
      emit(LoginSuccessState());
    });
  }


}
